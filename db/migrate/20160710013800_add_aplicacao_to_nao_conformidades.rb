class AddAplicacaoToNaoConformidades < ActiveRecord::Migration
  def change
    add_reference :nao_conformidades, :aplicacao, index: true, foreign_key: true
  end
end
