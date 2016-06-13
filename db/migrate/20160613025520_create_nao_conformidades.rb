class CreateNaoConformidades < ActiveRecord::Migration
  def change
    create_table :nao_conformidades do |t|
      t.string :descricao
      t.string :origem
      t.integer :prazo
      t.references :checklist, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
