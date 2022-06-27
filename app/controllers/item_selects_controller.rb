class ItemSelectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
    @selected_item = ItemSelect.new
    @user = User.find_by(id: params[:format])
  end 

  def create
    @selected_item = ItemSelect.new(select_params)
    if @selected_item.save!
      redirect_to root_path   
    else 
      redirect_to room_path     
    end
  end

  private
  def select_params
    params.permit(:tops_item_id, :adviser_id, :user_id)
  end
end
