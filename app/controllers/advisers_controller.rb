class AdvisersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(adviser_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def adviser_params
    params.require(:advisers).permit(:nickname, :email, :self_introduction, :image)
  end
end
