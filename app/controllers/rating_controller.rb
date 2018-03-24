class RatingController < ApplicationController

  def index
    @ratings = Rating.all
    render json: @ratings.to_json(:methods => [:women_ratio]), status: :ok
  end

  def show
    @rating = Rating.find(params[:id])
    render json: @rating.to_json(:methods => [:women_ratio]), status: :ok
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @institution = Institution.find_by(id: params[:institution_id])
    if @user.blank?
      render json: { errors: [user: 'user does not exist'] }, status: :not_found
    elsif @institution.blank?
      render json: { errors: [institution: 'institution does not exist'] }, status: :not_found
    else
      # ActiveRecord::Base.transaction do
      #   @rating = @user.ratings.create(rating_params)
      #   @institution.ratings << @rating
      #   @institution.save!
      # end
      @rating = @user.ratings.new(rating_params)
      @institution.ratings << @rating

      if @institution.save
        head :ok
      else
        render json: @rating.errors, status: :bad_request
      end
    end
  end

  private

  def rating_params
    params
      .require(:rating)
      .permit(:rating, :feedback_title, :feedback_content)
  end
end
