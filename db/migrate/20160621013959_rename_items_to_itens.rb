class RenameItemsToItens < ActiveRecord::Migration
  def change
    rename_table :items, :itens
  end
end
