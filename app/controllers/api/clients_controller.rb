class Api::ClientsController < ApplicationController
  def create
    @client = Client.new params[:client]

    if @client.save

      if params[:first_comment]
        @comment = @client.comments.build params[:first_comment]
        @comment.save
      end

      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end
end