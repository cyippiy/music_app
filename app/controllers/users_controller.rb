class UsersController < ApplicationController
  before_action :require_logout, only:[:new,:create]
  before_action :require_login, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!
      redirect_to user_url
    else
      flash.now[:errors] = @users.errors.fullmessages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
