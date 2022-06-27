class TopsItemsController < ApplicationController
  def new
    @tops_item = TopsItem.new
  end
  def create
    @tops_item = TopsItem.new(tops_params)
    if @tops_item.save
      redirect_to root_path
    else 
      render :new
    end 
  end

  private
  def tops_params
    params.require(:tops_item).permit({images: []}).merge(user_id: current_user.id)
  end
end
