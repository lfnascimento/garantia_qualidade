class NaoConformidade < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  belongs_to :aplicacao

  alias_attribute :responsavel, :user

  validates :descricao, :item, :aplicacao, :user, :prazo, presence: true

end
