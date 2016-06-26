class AplicacoesController < ApplicationController

  def create
    p "aplicacoes #{aplicacao_params}"
    p "params id #{params[:id]}"
    @aplicacao = Aplicacao.new(aplicacao_params)

    respond_to do |format|
      if @aplicacao.save
        format.html { redirect_to @aplicacao, notice: 'Checklist aplicada com sucesso.' }
        format.json { render :show, status: :created, location: @aplicacao }
      else
        format.html { render :new }
        format.json { render json: @aplicacao.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @aplicacao = Aplicacao.find(params[:id])
    #@itens = @checklist.itens
  end

  private

  def aplicacao_params
    params.require(:aplicacao).permit(:prazo, :checklist_id, :projeto_id)
  end
end
