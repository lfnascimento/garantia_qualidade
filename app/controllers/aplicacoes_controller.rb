class AplicacoesController < ApplicationController

  def create
    p80 aplicacao_params
    aplicacao_params.merge!("prazo" => aplicacao_params["prazo"].to_i)
    @aplicacao = Aplicacao.new(aplicacao_params)
    p80 @aplicacao.checklist
    p80 @aplicacao.projeto
    p80 @aplicacao.prazo

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
    @aplicacao = Aplicacao.find(params[:id])
    checa_organizacao
    @checklist = @aplicacao.checklist
    @itens = @checklist.itens_ordernados
    @nao_conformidade = NaoConformidade.new
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

