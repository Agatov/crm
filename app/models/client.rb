class Client < ActiveRecord::Base
  attr_accessible :name, :number, :phone, :status_cd, :status

  has_many :comments
  has_many :deliveries

  as_enum :status, [:new, :rejected, :thinking, :recall, :in_progress, :success], prefix: :true
end
