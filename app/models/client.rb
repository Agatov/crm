class Client < ActiveRecord::Base
  attr_accessible :name, :number, :phone, :status_cd, :status, :email, :sale_sms_sended

  has_many :comments
  has_many :deliveries
  has_many :smss
  has_many :meetings

  as_enum :status, [
      :new,
      :rejected,
      :thinking,
      :recall,
      :waiting_for_email,
      :send_email,
      :meeting,
      :in_progress,
      :prepayment_received,
      :in_work,
      :success
  ], prefix: true


  scope :new_clients, where(status_cd: Client.statuses(:new))
  scope :active_clients, where(status_cd: Client.statuses(:waiting_for_email, :send_email, :in_progress, :prepayment_received, :in_work))
  scope :recall_clients, where(status_cd: Client.statuses(:recall))
  scope :rejected_clients, where(status_cd: Client.statuses(:rejected))
  scope :success_clients, where(status_cd: Client.statuses(:success))


  def send_sms(text)
    self.smss.create(text: text)
  end

  def send_too_many_leads_sms
    self.smss.create(text: I18n.t('sms.too_many_leads'))
  end

  def send_sale_sms
    self.smss.create(text: I18n.t('sms.sale'))
    self.update_attributes(sale_sms_sended: true)
  end
end
