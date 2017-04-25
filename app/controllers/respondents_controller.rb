class RespondentsController < ApplicationController
  before_action :set_respondent, only: [:show, :edit, :update, :destroy]

  # GET /respondents
  # GET /respondents.json
  def index
    redirect_user
    @respondents = Respondent.all
  end

  # GET /respondents/1
  # GET /respondents/1.json
  def show
    redirect_user
  end
  # Csv to DB
  def import
    redirect_user
    Respondent.import(params[:file],params[:project_id])

    redirect_to root_path, notice: "Importado correctamente!"
  end
  # GET /respondents/new
  def new
    redirect_user
    @respondent = Respondent.new
    @projects = Project.all
  end

  # GET /respondents/1/edit
  def edit
    redirect_user
    @projects = Project.all
  end

  # POST /respondents
  # POST /respondents.json
  def create
    redirect_user
    @respondent = Respondent.new(respondent_params)

    respond_to do |format|
      if @respondent.save
        format.html { redirect_to @respondent, notice: 'Encuestado creado.' }
        format.json { render :show, status: :created, location: @respondent }
      else
        format.html { render :new }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respondents/1
  # PATCH/PUT /respondents/1.json
  def update
    redirect_user
    respond_to do |format|
      if @respondent.update(respondent_params)
        format.html { redirect_to @respondent, notice: 'Encuestado actualizado.' }
        format.json { render :show, status: :ok, location: @respondent }
      else
        format.html { render :edit }
        format.json { render json: @respondent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respondents/1
  # DELETE /respondents/1.json
  def destroy
    redirect_user
    @respondent.destroy
    respond_to do |format|
      format.html { redirect_to respondents_url, notice: 'Encuestado eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respondent
      @respondent = Respondent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respondent_params
      params.require(:respondent).permit(:phone, :name, {:project_ids => []})
    end

    def redirect_user
      if current_user.supervisor_role?
      else
          redirect_to calls_project_path(current_user.projects.first)
      end
    end
end
