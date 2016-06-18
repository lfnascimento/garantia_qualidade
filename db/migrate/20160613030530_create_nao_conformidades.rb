class CreateNaoConformidades < ActiveRecord::Migration
  def change
    create_table :nao_conformidades do |t|
      t.references :checklist, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.text :descricao
      t.text :origem
      t.integer :prazo

      t.timestamps null: false
    end
  end
end
