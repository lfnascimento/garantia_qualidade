class NaoConformidade < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :item
  belongs_to :user
  belongs_to :aplicacao

  alias_attribute :responsavel, :user

  before_create :atribuir_checklist

  validates :descricao, :item, :aplicacao, :user, :checklist, :prazo, presence: true

  def prazo_data
    data = created_at + prazo.days
    data.strftime("%d/%m/%Y")
  end

  private

  def atribuir_checklist
    self.checklist = self.aplicacao.checklist
  end
end
