class Client < ActiveRecord::Base
  attr_accessible :name, :number, :phone, :status_cd, :status

  has_many :comments
  has_many :deliveries

  as_enum :status, [
      :new,
      :rejected,
      :thinking,
      :recall,
      :waiting_for_email,
      :send_email,
      :mailed,
      :in_progress,
      :prepayment_received,
      :in_work,
      :success
  ], prefix: :true
end
