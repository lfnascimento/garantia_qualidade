class AdminController < ApplicationController

  def index
    @users = User.all.where(organizacao: current_user.organizacao)
  end

  def trocar_papel
    unless params[:user].blank?
      @users = []
      User.transaction do
      params[:user].each do |id, value|
        user = User.find(id)
        if user.organizacao == current_user.organizacao
          user.papel = params[:user][id][:papel]
          user.avaliado = params[:user][id][:avaliado] ? true : false
          @users << user
          user.save
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