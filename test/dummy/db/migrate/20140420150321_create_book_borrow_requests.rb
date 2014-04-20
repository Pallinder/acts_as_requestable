class CreateBookBorrowRequests < ActiveRecord::Migration
  def change
    create_table :book_borrow_requests do |t|
      t.integer :book_id

      t.timestamps
    end
  end
end
