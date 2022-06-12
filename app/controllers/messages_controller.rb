class MessagesController < ApplicationController
  def index
    @message = Meaage.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private
  
  def message_params
    if user_signed_in?
      params.require(:message).permit(:content).merge(user_id: current_user.id)
    elsif adviser_signed_in?
      @messages = @room.messages.includes(:user)
      params.require(:message).permit(:content).merge(adviser_id: current_adviser.id)
    end
  end 
end
