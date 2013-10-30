namespace :actions do
  task :sale => :environment do

    @clients = Client.rejected_clients.where(sale_sms_sended: false).order('id desc')

    @clients.each do |client|
      client.send_sale_sms
      puts "sms sended to clien ##{client.id}"
    end

  end
end