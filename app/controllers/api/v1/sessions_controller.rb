class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def show
    render json: {
      id: current_user.id, #from ApplicationController
      name: current_user.name
    }
  end

  def create #logging in
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload) #from ApplicationController
      render json: { jwt: token, message: "You're logged in"}
    else
      render json: { message: 'Fail'}
    end
  end

end
