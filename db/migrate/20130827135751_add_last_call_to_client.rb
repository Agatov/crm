class AddLastCallToClient < ActiveRecord::Migration
  def change
    add_column :clients, :last_call_at, :datetime
  end
end
