class ProjetosController < ApplicationController
  before_action :authenticate_user!, :set_projeto, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /projetos
  # GET /projetos.json
  def index
    @projetos = Projeto.find_all_by_organizacao(current_user.organizacao)
  end

  # GET /projetos/1
  # GET /projetos/1.json
  def show
  end

  # GET /projetos/new
  def new
    @projeto = Projeto.new
    @responsaveis = User.find_all_by_organizacao(current_user.organizacao)
    #Rails.logger.debug
    @projeto.users.build
  end

  # GET /projetos/1/edit
  def edit
  end

  # POST /projetos
  # POST /projetos.json
  def create
    params = projeto_params
    users = params["users_attributes"]
    params.delete("users_attributes")

    @projeto = Projeto.new(params)

    users.each do |index, value|
      id = value[:projeto_id].to_i
      user = User.find(id)
      user.projeto = @projeto
      user.save
    end


    respond_to do |format|
      if @projeto.save
        format.html { redirect_to @projeto, notice: 'Projeto criado com sucesso.' }
        format.json { render :index, status: :created, location: @projeto }
      else
        format.html { render :new }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projetos/1
  # PATCH/PUT /projetos/1.json
  def update
    respond_to do |format|
      if @projeto.update(projeto_params)
        format.html { redirect_to @projeto, notice: 'Projeto was successfully updated.' }
        format.json { render :index, status: :ok, location: @projeto }
      else
        format.html { render :edit }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projetos/1
  # DELETE /projetos/1.json
  def destroy
    @projeto.destroy
    respond_to do |format|
      format.html { redirect_to projetos_url, notice: 'Projeto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def checa_organizacao
    if @projeto.organizacao != current_user.organizacao
      flash[:notice] = "Acesso não permitido!"
      redirect_to root_path
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projeto
      @projeto = Projeto.find(params[:id])
      checa_organizacao
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projeto_params
      params.require(:projeto).permit(:nome, :desc, :responsavel,
                            users_attributes: [:projeto_id])
    end
end
