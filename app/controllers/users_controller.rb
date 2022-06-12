class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def adviser_params
    params.require(:users).permit(:nickname, :email, :image)
  end
end
