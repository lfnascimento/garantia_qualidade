class ChangeOrganizacaoDefaultOnUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :organizacao_id, 1
  end
end
