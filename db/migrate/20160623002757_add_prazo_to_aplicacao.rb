class AddPrazoToAplicacao < ActiveRecord::Migration
  def change
    add_column :aplicacoes, :prazo, :date
  end
end
