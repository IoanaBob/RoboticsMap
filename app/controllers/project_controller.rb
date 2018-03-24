class ProjectController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end

  def show
    @project = Project.find(params[:id])
    render json: @project, status: :ok
  end

  def create
    @institution = Institution.find_by(id: params[:institution_id])
    
    if @institution.blank?
      render json: { errors: [institution: 'institution does not exist'] }, status: :not_found
    else
      @project = @institution.projects.new(project_params)

      if @project.save
        head :ok
      else
        render json: @project.errors, status: :bad_request
      end
    end
  end

  private

  def project_params
    params
      .require(:project)
      .permit(:name, :description, :women_ratio, :leader_name)
  end
end
