class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite_instaclone_contents = @user.favorite_instaclone_contents
  end
end
