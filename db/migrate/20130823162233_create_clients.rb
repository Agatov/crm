class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :number
      t.integer :status_cd, default: 0

      t.timestamps
    end
  end
end
