class AdminController < ApplicationController

  def index
    @users = User.all
  end

  def trocar_papel
    unless params[:papeis].blank?
      params[:papeis].each do |key,value|
        id=key.gsub(/\D/,'')
        user=User.find(id)
        user.papel=value
        user.save!
      end
    end
  end

end