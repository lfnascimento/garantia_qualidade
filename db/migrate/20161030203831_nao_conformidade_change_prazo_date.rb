class NaoConformidadeChangePrazoDate < ActiveRecord::Migration
  def change
    change_column(:nao_conformidades, :prazo, :date)
  end
end
