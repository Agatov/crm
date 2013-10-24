class ClientsController < ApplicationController
  def index

    if params[:with_status]

      case params[:with_status]

        when 'new'
          @clients = Client.new_clients.order('id desc')
        when 'active'
          @clients = Client.active_clients.order('id desc')
        when 'recall'
          @clients = Client.recall_clients.order('id desc')
        when 'rejected'
          @clients = Client.rejected_clients.order('id desc')
        when 'success'
          @clients = Client.success_clients.order('id desc')




      end

    else
      @clients = Client.order('id desc')
    end




  end

  def show
    @client = Client.find params[:id]
    @comments = @client.comments.order('id desc')
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new params[:client]

    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def edit
    @client = Client.find params[:id]
  end

  def update
    @client = Client.find params[:id]

    if @client.update_attributes params[:client]
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def status
    @client = Client.find params[:id]

    if @client.status_cd != params[:status_cd].to_i
      @client.update_attributes(status: params[:status])
      @client.comments.create(
          content: I18n.t("clients.change_status_comment", status: Client.statuses_for_select[params[:status_cd].to_i][0])
      )
    end

    redirect_to :back
  end


  def send_sms
    @client = Client.find params[:id]
    @client.send_sms params[:client][:sms]
    redirect_to :back
  end

  def send_weekend_sms
    @client = Client.find params[:id]
    @client.send_sms I18n.t 'sms.weekend_sms'
    redirect_to :back
  end



  def destroy
    @client = Client.find params[:id]
    @client.destroy
    redirect_to clients_path
  end

end