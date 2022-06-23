class UsersController < ApplicationController
  def index
    @items = Item.all
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @item = @user.item
  end

  private

  def user_params
    params.require(:users).permit(:nickname, :email, :image)
  end
end
