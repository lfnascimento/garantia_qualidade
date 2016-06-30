class RenameResponsavelOnUsersToAvaliado < ActiveRecord::Migration
  def change
    rename_column :users, :responsavel, :avaliado
  end
end
