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

  def create
    params = projeto_params
    @projeto = Projeto.new(params.merge(organizacao: current_user.organizacao))

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
    def set_projeto
      @projeto = Projeto.find(params[:id])
      checa_organizacao
    end

    def projeto_params
      params.require(:projeto).permit(:nome, :desc, user_ids:  [])
    end
end
