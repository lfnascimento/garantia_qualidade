class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :desc
      t.string :responsavel

      t.timestamps null: false
    end
  end
end
