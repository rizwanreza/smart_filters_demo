class CreateAddressBooks < ActiveRecord::Migration
  def self.up
    create_table :address_books do |t|
      t.string :name
      t.text :address
      t.integer :zipcode
      t.string :company
      t.string :email
      t.string :phone
      t.string :domain

      t.timestamps
    end
  end

  def self.down
    drop_table :address_books
  end
end
