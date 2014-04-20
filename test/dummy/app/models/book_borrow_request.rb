class BookBorrowRequest < ActiveRecord::Base
  acts_as_requestable after_decline: :was_declined, after_accept: :was_accepted
  attr_accessor :i
  
  
  def was_declined
    self.i = false
  end

  def was_accepted
    self.i = true
  end
end
