class AplicacoesController < ApplicationController

  def create
    @aplicacao = Aplicacao.new(aplicacao_params)

    respond_to do |format|
      if @aplicacao.save
        format.html { redirect_to @aplicacao, notice: 'Checklist aplicada com sucesso.' }
        format.json { render :index, status: :created, location: @aplicacao }
      else
        format.html { render :new }
        format.json { render json: @aplicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @aplicacao = Aplicacao.find(params[:id])
    checa_organizacao
    @checklist = @aplicacao.checklist
    @itens = @checklist.itens_ordernados
  end

  private

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

  private

  def aplicacao_params
    params.require(:aplicacao).permit(:prazo, :checklist_id, :projeto_id)
  end

end

