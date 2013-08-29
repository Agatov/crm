class Delivery < ActiveRecord::Base
  attr_accessible :address, :cost, :date, :number, :user_id

  belongs_to :client
end
