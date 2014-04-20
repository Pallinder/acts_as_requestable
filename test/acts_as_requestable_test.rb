require 'test_helper'

class ActsAsRequestableTest < ActiveSupport::TestCase
  test 'an acts as requestable model should have accept/decline methods' do
    assert_includes BookBorrowRequest.new.methods, :accept_request
    assert_includes BookBorrowRequest.new.methods, :decline_request
  end

  test 'after decline or accept it should call whatever method is specified' do
    bbr = BookBorrowRequest.new
    bbr.accept_request
    assert_equal bbr.i, true

    bbr.decline_request
    assert_equal bbr.i, false
  end

  test 'after decline or accept it should set its property to the right one' do
    bbr = BookBorrowRequest.new
    bbr.accept_request
    assert_equal bbr.request_confirmed, true

    bbr.decline_request
    assert_equal bbr.request_confirmed, false
  end

  test 'an acts as requestable model should have scopes to find requests' do
    bbr = BookBorrowRequest.new
    bbr.book_id = 1
    bbr.save
    assert_equal BookBorrowRequest.unconfirmed_requests.count, 1

    bbr.accept_request

    assert_equal BookBorrowRequest.accepted_requests.count, 0
  end
end
