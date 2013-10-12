class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.integer :client_id
      t.text :text
      t.integer :status_cd

      t.timestamps
    end
  end
end
