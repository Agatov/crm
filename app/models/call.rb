class Call < ActiveRecord::Base
  attr_accessible :client_id, :client, :comment, :date, :done, :reason

  belongs_to :client
end
