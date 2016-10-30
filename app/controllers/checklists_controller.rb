class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]
  # GET /checklists
  # GET /checklists.json
  def index
    @checklists = Checklist.find_all_by_organizacao(current_user.organizacao).
      paginate(page: params[:page], per_page: 4)
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    @itens = @checklist.itens
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
    @checklist.itens.build
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = Checklist.new(checklist_params.merge(organizacao: current_user.organizacao))

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to @checklist, notice: 'Checklist criada com sucesso.' }
        format.json { render :index, status: :created, location: @checklist }
      else
        format.html { render :new }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checklists/1
  # PATCH/PUT /checklists/1.json
  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { render :index, status: :ok, location: @checklist }
      else
        format.html { render :edit }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist.destroy
    respond_to do |format|
      format.html { redirect_to checklists_url, notice: 'Checklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aplicacao
    @checklist = Checklist.find(params[:id])
    checa_organizacao
    @aplicacao = Aplicacao.new
  end

  protected

  def checa_organizacao
    if @checklist.organizacao != current_user.organizacao
      flash[:notice] = "Acesso não permitido!"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
      checa_organizacao
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checklist_params
      params.require(:checklist).permit(:identificacao, :fase,
                                        itens_attributes: [:descricao, :produto, :processo, :ordem])
    end
end
