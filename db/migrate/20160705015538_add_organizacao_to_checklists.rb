class AddOrganizacaoToChecklists < ActiveRecord::Migration
  def change
    add_reference :checklists, :organizacao, index: true, foreign_key: true
  end
end
