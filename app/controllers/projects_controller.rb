class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy,:calls]

  # GET /projects
  # GET /projects.json
  def index
    #redirect_user
    @projects = Project.all

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #redirect_user
    @users = User.all
  end

  def state
    a=State.find(params[:state][:id])
    a.state=params[:state][:state]
    a.note=params[:state][:note]
    a.save
    #raise params
    redirect_to calls_project_path(params[:id])
  end
  def calls
    @projects=current_user.projects
    @respondent = @project.respondents.order("RANDOM()").first
    @state=State.find_by(respondent: @respondent.id,project: @project.id )
    #<%= @state.state %>
  end

  # GET /projects/new
  def new
    #redirect_user
    @project = Project.new
    @users = User.all
  end

  # GET /projects/1/edit
  def edit
    redirect_user
    @users = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    #redirect_user
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Proyecto creado.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    #redirect_user
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Proyecto actualizado.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    redirect_user
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Proecto eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :company, :start, :finish, :need, :url, {:user_ids => []})
    end

  	def redirect_user
      if current_user.supervisor_role?
      else
          redirect_to calls_project_path(current_user.projects.first)
      end
  	end

end
