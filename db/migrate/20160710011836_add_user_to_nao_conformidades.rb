class AddUserToNaoConformidades < ActiveRecord::Migration
  def change
    add_reference :nao_conformidades, :user, index: true, foreign_key: true
  end
end
