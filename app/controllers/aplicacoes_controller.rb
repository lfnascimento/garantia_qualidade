class AplicacoesController < ApplicationController
  before_action :set_aplicacao, only: [:edit, :update, :destroy, :show]

  def index
    @aplicacoes = Aplicacao.find_all_by_organizacao(current_user.organizacao).
      paginate(page: params[:page], per_page: 4)
  end

  def new
    @checklist = Checklist.find(params[:checklist_id])
    @aplicacao = Aplicacao.new
  end

  def create
    aplicacao_params.merge!("prazo" => aplicacao_params["prazo"].to_i)
    @aplicacao = Aplicacao.new(aplicacao_params)

    respond_to do |format|
      if @aplicacao.save
        format.html { redirect_to @aplicacao, notice: 'Checklist aplicada com sucesso.' }
        format.json { render :index, status: :created, location: @aplicacao }
      else
        flash[:error] = "Não foi possível aplicar a Checklist. Por favor, verifique se não deixou algum campo em branco"
        format.html { redirect_to :back }
        format.json { render json: @aplicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    checa_organizacao
    @checklist = @aplicacao.checklist
    @itens = @checklist.itens_ordernados
    @nao_conformidade = NaoConformidade.new
  end

  def destroy
    @aplicacao.destroy
    respond_to do |format|
      format.html { redirect_to checklist_aplicacoes_url(@aplicacao.checklist), notice: 'Aplicação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

   def set_aplicacao
     @aplicacao = Aplicacao.find(params[:id])
   end

   def checa_organizacao
    if @aplicacao.checklist.organizacao != current_user.organizacao
      flash[:notice] = "Acesso não permitido!"
      if request.env["HTTP_REFERER"].present?
        redirect_to :back
      else
        redirect_to root_path
      end
    end
  end

  def aplicacao_params
    params.require(:aplicacao).permit(:prazo, :checklist_id, :projeto_id)
  end

end

