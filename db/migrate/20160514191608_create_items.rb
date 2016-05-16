class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :descricao
      t.boolean :produto
      t.boolean :processo
      t.belongs_to :checklist, index: true
      t.timestamps null: false
    end
  end
end
