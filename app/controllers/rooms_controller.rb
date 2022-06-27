class RoomsController < ApplicationController

  def index
  end 

  def new 
    @room = Room.new
  end 

  def show
    @room = Room.find(params[:id]) 
    @message = Message.new 
    @messages = @room.messages
    @selected_item = ItemSelect.where(adviser_id: @room.adviser_id).where(user_id: @room.user_id).pluck(:tops_item_id)
    @tops_item = TopsItem.find_by(user_id: @room.user_id)
    if @selected_item.present?
      @image = @tops_item.images.find_by(blob_id: @selected_item)
    end
    if user_signed_in?
      if @room.user.id == current_user.id
        @adviser = @room.adviser
      else
        redirect_to "/"
      end
    elsif adviser_signed_in?
      if @room.adviser.id == current_adviser.id
        @user = @room.user
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_adviser_params)
      @room.user_id = current_user.id
    elsif adviser_signed_in?
      @room = Room.new(room_user_params)
      @room.adviser_id = current_adviser.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  private
  def room_adviser_params
    params.require(:room).permit(:adviser_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
