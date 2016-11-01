class AddPictureToOrganizacoes < ActiveRecord::Migration
  def change
    add_column :organizacoes, :picture, :string
  end
end
