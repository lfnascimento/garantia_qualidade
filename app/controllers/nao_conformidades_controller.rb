class NaoConformidadesController < ApplicationController
  before_action :set_nao_conformidade, only: [:edit, :update, :destroy, :show]
  before_action :set_aplicacoes, only: [:new, :edit]
  before_action :authenticate_user!

  load_and_authorize_resource

  # GET /nao_conformidades
  # GET /nao_conformidades.json
  def index
    @nao_conformidades =  NaoConformidade.joins(aplicacao: {checklist: :organizacao}).
        where("checklists.organizacao_id = ?", current_user.organizacao_id)
    if current_user.avaliado?
      @nao_conformidades = @nao_conformidades.select { |nc| nc.user == current_user }
    end
  end

  # GET /nao_conformidades/1
  # GET /nao_conformidades/1.json
  def show
  end

  # GET /nao_conformidades/new
  def new
    @nao_conformidade = NaoConformidade.new
  end

  # GET /nao_conformidades/1/edit
  def edit
  end

  # POST /nao_conformidades
  # POST /nao_conformidades.json
  def create
    @nao_conformidade = NaoConformidade.new(nao_conformidade_params)

    respond_to do |format|
      if @nao_conformidade.save
        format.html { redirect_to @nao_conformidade, notice: 'Nao conformidade was successfully created.' }
        format.json { render :index, status: :created, location: @nao_conformidade }
      else
        format.html { render :new }
        format.json { render json: @nao_conformidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nao_conformidades/1
  # PATCH/PUT /nao_conformidades/1.json
  def update
    respond_to do |format|
      if @nao_conformidade.update(nao_conformidade_params)
        format.html { redirect_to @nao_conformidade, notice: 'Nao conformidade was successfully updated.' }
        format.json { render :index, status: :ok, location: @nao_conformidade }
      else
        format.html { render :edit }
        format.json { render json: @nao_conformidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nao_conformidades/1
  # DELETE /nao_conformidades/1.json
  def destroy
    @nao_conformidade.destroy
    respond_to do |format|
      format.html { redirect_to nao_conformidades_url, notice: 'Nao conformidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def salvar_status
    if params[:nao_conformidades]
      params[:nao_conformidades].each do |index, id|
        nc = NaoConformidade.find(index)
        nc.status = id[:status]
        nc.save!
      end
    end
    respond_to do |format|
      format.html { redirect_to nao_conformidades_url, notice: 'Não Conformidades salvas com sucesso.' }
    end
  end

  def alertar_responsavel
    nc = NaoConformidade.find(params[:nc_id])
    respond_to do |format|
      if NaoConformidadeMailer.alertar_responsavel_email(nc.user, nc).deliver
        format.html { redirect_to nao_conformidades_url, notice: 'Email enviado.' }
      else
        format.html { redirect_to nao_conformidades_url, notice: 'Problema ao enviar o email de notificação.' }
      end
    end
  end


  def get_checklist_itens
    if !params[:aplicacao_id].blank?
      aplicacao = Aplicacao.find(params[:aplicacao_id])
      @item_options = aplicacao.checklist.itens.sort_by{ |item| item.descricao }
      @item_options = @item_options.map { |item| [item.descricao, item.id] }
    else
      @item_options = [[]]
    end

    render :partial => 'item_options', :layout => nil
  end

  def get_responsaveis
    if !params[:aplicacao_id].blank?
      aplicacao = Aplicacao.find(params[:aplicacao_id])
      responsaveis_options = aplicacao.projeto.users.sort_by{ |user| user.nome }
      @responsaveis_options = responsaveis_options.map { |user| [user.to_s, user.id] }
    else
      @responsaveis_options = [[]]
    end
    render :partial => 'responsaveis_options', :layout => nil
  end

  protected

  def checa_organizacao(nao_conformidade)
    p "Nao conformidade: #{nao_conformidade.aplicacao}"
    @aplicacao = nao_conformidade.aplicacao
    p "Aplicacao: #{@aplicacao}"
    if @aplicacao.checklist.organizacao != current_user.organizacao
      flash[:notice] = "Acesso não permitido!"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back
      else
        redirect_to root_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nao_conformidade
      @nao_conformidade = NaoConformidade.find(params[:id])
      checa_organizacao(@nao_conformidade)
    end

  def set_aplicacoes
    @aplicacoes = Aplicacao.find_all_by_organizacao(current_user.organizacao)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nao_conformidade_params
      params.require(:nao_conformidade).permit(:descricao, :origem, :prazo, :aplicacao_id, :item_id, :user_id)
    end
end
