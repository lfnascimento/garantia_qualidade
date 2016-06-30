class RespostasController < ApplicationController

  def salvar_respostas
    #p resposta_params
    #resposta_params.each do |key, value|
    p params[:resposta][:item_id]
    p "params ID #{params[:id]}"
    aplicacao = params[:aplicacao_id]
    respostas = []
    params[:resposta][:item_id].each do |key, value|
      resposta = Resposta.new(aplicacao_id: aplicacao, item_id: key, resposta: value)
      respostas << resposta.save
    end

    if respostas.include?(nil)
      render aplicacoes_path
    else
      redirect_to aplicacao_respostas_path, notice: 'As respostas da Aplicação da Checklist foram salvas com sucesso.'
    end
  end

  def index
    @respostas = Resposta.all.where(aplicacao_id: params[:aplicacao_id])
    p @respostas
    @resposta = @respostas.first
    p @resposta
    @aplicacao = @resposta.aplicacao
    @checklist = @aplicacao.checklist
  end

  private
=begin
  def resposta_params
    params.require(:resposta).permit(:item_id)
  end
=end
end
