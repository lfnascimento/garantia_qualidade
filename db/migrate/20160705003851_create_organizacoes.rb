class CreateOrganizacoes < ActiveRecord::Migration
  def change
    create_table :organizacoes do |t|
      t.string :nome
      t.text :descricao
      t.string :logo

      t.timestamps null: false
    end
  end
end
