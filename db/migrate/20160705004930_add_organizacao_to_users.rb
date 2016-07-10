class AddOrganizacaoToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :organizacao, index: true, foreign_key: true
  end
end
