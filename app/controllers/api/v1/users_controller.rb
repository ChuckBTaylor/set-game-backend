class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? (redirect_to api_v1_user_path(@user)) : (render json: {message: 'Fail'})
  end

  def show

    render json:@user
  end

  def edit
  end

  def update
    @user.update(user_params) ? (redirect_to api_v1_user_path(@user)) : (render :edit)
  end

  def destroy
    @user.destroy
    redirect_to api_v1_users_path
  end

  def login # post user data, sends back jwt token and user info
    @user = User.find_by(name: user_params['name']) # we don't have params[:id] so we can't search by id or use the show action
    if @user.authenticate(user_params['password'])
      render json: @user
    else
      render json: {message: 'Fail'}
    end
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :high_score)
  end

end
