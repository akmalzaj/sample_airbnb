class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
        t.string :property_type
        t.string :description
        t.string :location
        t.string :price
        t.integer :user_id

        t.timestamps null:false
    end
  end
end
