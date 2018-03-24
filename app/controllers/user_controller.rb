class UserController < ApplicationController
  def index
    categories = User.all
    render json: categories, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      head :ok
    else
      render json: user.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_admin, :name, :email, :username)
  end
end
