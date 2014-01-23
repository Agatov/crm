class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :client_id
      t.string :address
      t.datetime :date
      t.text :comment
      t.boolean :done, default: 0

      t.timestamps
    end
  end
end
