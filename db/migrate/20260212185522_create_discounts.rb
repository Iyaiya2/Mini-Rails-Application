class CreateDiscounts < ActiveRecord::Migration[8.1]
  def change
    create_table :discounts do |t|
      t.string :title
      t.string :email
      t.date :expiration_date
      t.text :description
      t.text :image_data

      t.timestamps
    end
  end
end
