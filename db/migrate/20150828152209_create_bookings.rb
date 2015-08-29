class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
        t.time :book_start
        t.time :book_end
        t.integer :property_id
        t.integer :user_id

        t.timestamps null:false
    end
  end
end
