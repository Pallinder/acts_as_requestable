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
     
```

### Options
Configuration options
* after_decline - method to be called after request has been declined
     
* after_accept- method to be called after request has been accepted
