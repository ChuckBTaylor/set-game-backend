class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? (render json: {user: @user, jwt_token: issue_token({user_id: @user.id})}) : (render json: {message: 'Fail'})
  end

  def show

    render json:@user
  end

  def edit
  end

  def update
    @user = User.find(user_params['id'])
    @user.update(high_score: user_params['high_score'])
    render json: @user
  end

  def destroy
    @user.destroy
    redirect_to api_v1_users_path
  end

  def login # post user data, sends back jwt token and user info
    # @user = User.find_by(name: user_params['name'])
    @user = User.where('lower(name) = ?', user_params['name'].downcase).first # we don't have params[:id] so we can't search by id or use the show action
    if @user.authenticate(user_params['password'])
      render json: {user: @user, jwt_token: issue_token({user_id: @user.id})}
    else
      render json: {message: 'Fail'}
    end
  end

  def scores
    arr = User.all.sort_by do |a|
      a.high_score
    end.reverse
    render json: arr
  end

  def jwt
    user = current_user
    render json: user
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :id, :email, :password, :password_confirmation, :high_score)
  end

end
