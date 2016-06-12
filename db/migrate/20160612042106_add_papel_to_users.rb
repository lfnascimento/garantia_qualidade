class AddPapelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :papel, :string
  end
end
