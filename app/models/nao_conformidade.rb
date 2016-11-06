class NaoConformidade < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  belongs_to :aplicacao

  alias_attribute :responsavel, :user

  validates :descricao, :item, :aplicacao, :user, :prazo, presence: true

  def prazo_data
    data = created_at + prazo.days
    data.strftime("%d/%m/%Y")
  end

end
