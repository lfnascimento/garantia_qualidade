class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def trocar_papel
    unless params[:papel].blank?
      params[:papel].each do |key,value|
        #id=key.gsub(/\D/,'')
        id= key
        user=User.find(id)
        user.papel = value
        user.save!
      end

      respond_to do |format|
        format.js
      end
    end
  end

end