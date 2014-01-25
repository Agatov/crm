class Meeting < ActiveRecord::Base
  attr_accessible :address, :client_id, :client, :comment, :date, :done

  belongs_to :client
end
