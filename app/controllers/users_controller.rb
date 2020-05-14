class UsersController < ApplicationController
  def create
    user = User.create get_params
    if user.valid?
      head 200
    else
      render json: {errors: user.errors}, status: 400
    end
  end

  def get_params
    params.permit(:username, :password, :password_confirmation)
  end
end
