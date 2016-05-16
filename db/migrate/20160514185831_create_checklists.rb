class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :identificacao
      t.string :fase

      t.timestamps null: false
    end
  end
end
