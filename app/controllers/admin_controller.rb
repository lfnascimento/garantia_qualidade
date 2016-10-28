class AdminController < ApplicationController

  def index
    @users = User.all.where(organizacao: current_user.organizacao).
      paginate(page: params[:page], per_page: 4)
  end

  def trocar_papel
    unless params[:user].blank?
      @users = []
      User.transaction do
      params[:user].each do |id, value|
        user = User.find(id)
        if user.organizacao == current_user.organizacao
          papel = params[:user][id][:papel]
          avaliado = params[:user][id][:avaliado] ? true : false
          @users << user if user.update_attributes(papel: papel, avaliado: avaliado)

        else
          ActiveRecord::Rollback
          flash[:notice] = "Ação não permitida!"
          redirect_to root_path
        end
      end
      end
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def checa_organizacao
    if @checklist.organizacao != current_user.organizacao
      flash[:notice] = "Acesso não permitido!"
      redirect_to root_path
    end
  end
end
