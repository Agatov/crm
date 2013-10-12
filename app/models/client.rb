class Client < ActiveRecord::Base
  attr_accessible :name, :number, :phone, :status_cd, :status, :email

  has_many :comments
  has_many :deliveries
  has_many :smss

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
  ], prefix: true


  def send_sms(text)
    self.smss.create(text: text)
  end
end
