class AddNextCallToClient < ActiveRecord::Migration
  def change
    add_column :clients, :next_call_at, :datetime
  end
end
