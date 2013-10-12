class Sms < ActiveRecord::Base
  attr_accessible :client_id, :status_cd, :text

  belongs_to :client

  after_create :send_me


  # @todo Вынести отсылку смс в отдельный Service Object
  def send_me
    response = HTTParty.get(
        'http://api.sms24x7.ru',
        query: {
            method: 'push_msg',
            email: 'agatovs@gmail.com',
            password: 'avv6rqE',
            phone: "7#{client.phone}",
            text: text,
            sender_name: 'abardacha'
        }
    )

    client.comments.create( content: I18n.t("clients.send_sms_comment", sms_text: text) )

    if response.parsed_response['response']['msg']['text'] == 'OK'
      true
    else
      false
    end
  end

end
