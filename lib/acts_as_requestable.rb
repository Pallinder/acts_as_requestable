# Acts as requestable
# Small gem that tries to add the ability for a model to be used as a request
module ActsAsRequestable
  extend ActiveSupport::Concern
  included do
  end

  module ClassMethods

    # Adds the ability to treat the model as a request 

    # class RequestableModel < ActiveRecord::Base
    #   acts_as_requestable after_decline: :was_declined, after_accept: :was_accepted
    # 
    #   def was_declined
    #     puts "I was declined"
    #   end
    #
    #   def was_accepted
    #     puts "I was accepted"
    #   end
    # end
    # 
    # Configuration options
    # * <tt>after_decline</tt> - method to be called after request has been declined
    # * <tt>after_accept</tt> - method to be called after request has been accepted

    def acts_as_requestable(options = {})
      cattr_accessor :run_after_decline, :run_after_accept, :request_confirmed

      self.run_after_decline = options[:after_decline]
      self.run_after_accept = options[:after_accept]

      scope :unconfirmed_requests, lambda {
        where(reuqest_status: 0)
      }

      scope :accepted_requests, lambda {
        where(request_status: 1)
      }

      scope :declined_requests, lambda {
        where(request_status: 2)
      }

      include ActsAsRequestable::LocalInstanceMethods
    end
  end

  module LocalInstanceMethods
    def accept_request
      self.request_confirmed = true
      send(run_after_accept) unless run_after_accept.nil?
    end

    def decline_request
      self.request_confirmed = false
      send(run_after_decline) unless run_after_decline.nil?
    end
  end

  ActiveRecord::Base.send :include, ActsAsRequestable
end
