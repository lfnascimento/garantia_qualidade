class AddOrdemToItems < ActiveRecord::Migration
  def change
    add_column :items, :ordem, :integer
  end
end
