class ChangeAvaliadoDefaultOnUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :avaliado, false
  end
end
