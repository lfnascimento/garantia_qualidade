class AddResponsavelToUser < ActiveRecord::Migration
  def change
    add_column :users, :responsavel, :boolean
  end
end
