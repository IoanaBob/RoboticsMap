class CategoryController < ApplicationController
  def index
    categories = Category.all
    render json: categories, status: :ok
  end

  def show
    category = Category.find(params[:id])
    render json: category, status: :ok
  end

  def create
    category = Category.new(category_params)

    if category.save
      head :ok
    else
      render json: category.errors, status: :bad_request
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
