class V1::ProjectsController < V1::BaseController
  before_action :set_project, only: %i[show update destroy]

  # GET /projects
  def index
    @sort = sort_column
    @direction = sort_direction

    @projects = Project.reorder(sort_column + ' ' + sort_direction).page(params[:page]).per(params[:limit])

    @meta = pagination_dict(@projects)
  end

  # GET /projects/1
  def show
    
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render :show, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render :show
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  def sort_column
    params[:sort] || 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :destroyed_at)
  end
end
