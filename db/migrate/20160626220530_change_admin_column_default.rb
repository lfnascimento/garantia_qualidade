class ChangeAdminColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :admin, true)
  end
end
