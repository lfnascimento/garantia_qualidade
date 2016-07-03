class AddProjetoToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :projeto, index: true, foreign_key: true
  end
end
