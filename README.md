acts_as_requestable
===================

Small gem that allows a model to be confirmed/declined

## Example usage
```ruby

     class RequestableModel < ActiveRecord::Base
       acts_as_requestable after_decline: :was_declined, after_accept: :was_accepted
     
       def was_declined
         puts "I was declined"
       end
    
       def was_accepted
         puts "I was accepted"
       end
     end
     
     Configuration options
     * <tt>after_decline</tt> - method to be called after request has been declined
     * <tt>after_accept</tt> - method to be called after request has been accepted

```
