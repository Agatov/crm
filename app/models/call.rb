class Call < ActiveRecord::Base
  attr_accessible :client_id, :comment, :date, :done, :reason
end
