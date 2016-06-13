class NaoConformidadesController < ApplicationController
  before_action :set_nao_conformidade, only: [:show, :edit, :update, :destroy]

  # GET /nao_conformidades
  # GET /nao_conformidades.json
  def index
    @nao_conformidades = NaoConformidade.all
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
        format.json { render :show, status: :created, location: @nao_conformidade }
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
        format.json { render :show, status: :ok, location: @nao_conformidade }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nao_conformidade
      @nao_conformidade = NaoConformidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nao_conformidade_params
      params.require(:nao_conformidade).permit(:descricao, :origem, :prazo, :checklist_id, :item_id)
    end
end
