class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.boolean :resposta
      t.references :aplicacao, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
