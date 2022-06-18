class TopsController < ApplicationController
  def index
    if user_signed_in?
      @advisers = Adviser.all
      rooms = current_user.rooms
      @adviser_ids = []
      rooms.each do |r|
        @adviser_ids << r.adviser_id
      end 
    elsif adviser_signed_in?
      @users = User.all
      rooms = current_adviser.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
