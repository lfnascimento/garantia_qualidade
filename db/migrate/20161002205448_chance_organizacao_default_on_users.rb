class ChanceOrganizacaoDefaultOnUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :organizacao_id, nil
  end
end
