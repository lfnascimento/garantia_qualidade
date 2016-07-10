class AddStatusToNaoConformidades < ActiveRecord::Migration
  def change
    add_column :nao_conformidades, :status, :string, default: 'aberta'
  end
end
