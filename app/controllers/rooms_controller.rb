class RoomsController < ApplicationController

  def index
  end 

  def new 
    @room = Room.new
  end 

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    if user_signed_in?
      params.require(:room).permit(users_id: current_user.id)
    elsif adviser_signed_in?
      params.require(:room).permit(advisers_id: current_adviser.id)
    end
  end
end
