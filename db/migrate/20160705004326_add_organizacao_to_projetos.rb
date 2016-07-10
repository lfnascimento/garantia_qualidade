class AddOrganizacaoToProjetos < ActiveRecord::Migration
  def change
    add_reference :projetos, :organizacao, index: true, foreign_key: true
  end
end
