class AddSaleSmsSendedToClient < ActiveRecord::Migration
  def change
    add_column :clients, :sale_sms_sended, :boolean, default: 0
  end
end
