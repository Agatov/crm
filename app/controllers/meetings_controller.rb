class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.order('date desc')
  end

  def show
    @client = Client.find params[:client_id]
    @meeting = Meeting.find params[:id]
  end

  def new
    @client = Client.find params[:client_id]
    @meeting = @client.meetings.build
  end

  def create
    @client = Client.find params[:client_id]
    @meeting = @client.meetings.build(params[:meeting])

    if params[:date_string]



    end

    if @meeting.save
      @client.update_attributes(status: :meeting)
      redirect_to client_meeting_path(@client, @meeting)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end