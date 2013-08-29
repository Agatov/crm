class CommentsController < ApplicationController
  def create
    @client = Client.find params[:client_id]
    @comment = @client.comments.build params[:comment]
    @comment.save
    redirect_to :back
  end
end