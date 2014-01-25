class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :client_id
      t.string :reason
      t.datetime :date
      t.text :comment
      t.boolean :done, default: 0

      t.timestamps
    end
  end
end
