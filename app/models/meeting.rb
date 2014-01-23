class Meeting < ActiveRecord::Base
  attr_accessible :address, :client_id, :comment, :date, :done

  belongs_to :client
end
