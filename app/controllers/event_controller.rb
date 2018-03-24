class EventController < ApplicationController

  def index
    if params[:sort].present?
      case params[:sort]
      when "date" then @events = Event.order(created_at: :desc)
      when "latest" then @events = Event.order(:starting_date)
      else render json: { errors: [sort: 'sort type not existent'] }, status: :bad_request
      end
    else
      @events = Event.all
    end
    render json: @events, status: :ok
  end

  def show
    @event = Event.find(params[:id])
    render json: @event, status: :ok
  end

  def create
    @institution = Institution.find_by(id: params[:institution_id])
    
    if @institution.blank?
      render json: { errors: [institution: 'institution does not exist'] }, status: :not_found
    else
      @event = @institution.events.new(event_params)

      if @event.save
        head :ok
      else
        render json: @event.errors, status: :bad_request
      end
    end
  end

  private

  def event_params
    params
      .require(:event)
      .permit(:name, :capacity, :starting_date, :ending_date)
  end
end
