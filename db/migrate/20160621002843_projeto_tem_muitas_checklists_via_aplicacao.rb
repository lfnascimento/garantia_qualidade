class ProjetoTemMuitasChecklistsViaAplicacao < ActiveRecord::Migration
  def change
    create_table :aplicacoes do |t|
      t.belongs_to :projeto, index: true
      t.belongs_to :checklist, index: true
      t.datetime :data_aplicacao
      t.timestamps null:false
    end
  end
end
