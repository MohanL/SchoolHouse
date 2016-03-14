class UsersController < ApplicationController

  def index
    @users = User.guardians
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
