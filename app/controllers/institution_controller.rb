class InstitutionController < ApplicationController

  def index
    institutions = Institution.all
    puts(institutions.first.women_ratio)
    render json: institutions.to_json(:methods => [:women_ratio]), status: :ok
  end

  def search

  end

  def show
    institution = Institution.find(params[:id])
    render json: institution.to_json(:methods => [:women_ratio]), status: :ok
  end

  def create
    category = Category.find(params[:category_id])
    if category.blank?
      render json: { errors: [category: 'category does not exist'] }, status: :not_found
    else
      institution = category.institutions.new(institution_params)

      if institution.save
        head :ok
      else
        render json: institution.errors, status: :bad_request
      end
    end
  end

  def hello
    render json: {content: "Hello to Robotics Map API!"}, status: :ok
  end

  private

  def institution_params
    params
      .require(:institution)
      .permit(:address, :phone, :email, :name, :contact_name, :description, :member_count, :women_count)
  end
end
