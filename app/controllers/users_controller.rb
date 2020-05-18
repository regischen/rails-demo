class UsersController < ApplicationController
  before_action :find_user, only: [:update, :show]
  def create
    user = User.create get_params
    if user.valid?
      head 200
    else
      render json: {errors: user.errors}, status: 400
    end
  end
  def index
    users = User.all
    render json: {resources: users}
  end

  def show
    render json: {resource: @user}
  end

  def destroy
    User.destroy params[:id]
    head :ok
  end
  
  def update
    user = User.find params[:id]
    user.update update_params
    if user.valid?
      render json: {resource: user}, status: :ok
    else``
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  private
  def find_user
    @user = User.find params[:id]
  end

  def get_params
    params.permit(:username, :password, :password_confirmation, :nickname)
  end
  def update_params
    params.permit :nickname
  end
end
