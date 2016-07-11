class ChangeOrganizacaoNullToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :organizacao_id, 1
  end
end
