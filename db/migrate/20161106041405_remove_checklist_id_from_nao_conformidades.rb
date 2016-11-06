class RemoveChecklistIdFromNaoConformidades < ActiveRecord::Migration
  def change
    remove_foreign_key :nao_conformidades, :checklists
    remove_reference :nao_conformidades, :checklist, index: true
  end
end
