class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def trocar_papel
    unless params[:user].blank?
      params[:user].each do |id, value|
        user = User.find(id)
        user.papel = params[:user][id][:papel]
        user.avaliado = params[:user][id][:avaliado] ? true : false
        user.save!
      end
    end
    respond_to do |format|
      format.js
    end
  end
end