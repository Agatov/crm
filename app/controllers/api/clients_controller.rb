class Api::ClientsController < ApplicationController
  def create
    @client = Client.new params[:client]

    if @client.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end