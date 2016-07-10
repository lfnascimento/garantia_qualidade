class NaoConformidade < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :item
  belongs_to :user
  belongs_to :aplicacao

  alias_attribute :responsavel, :user
end
