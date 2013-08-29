class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :address
      t.datetime :date
      t.string :number
      t.integer :cost, default: 0

      t.timestamps
    end
  end
end
