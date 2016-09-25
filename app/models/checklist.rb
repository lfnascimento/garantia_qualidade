class Checklist < ActiveRecord::Base
  has_many :itens
  accepts_nested_attributes_for :itens
  has_many :aplicacoes
  has_many :projetos, through: :aplicacoes
  belongs_to :organizacao

  validates :identificacao, :fase, presence: true
  validates :identificacao, length: {maximum: 50}
  validates :fase, length: {maximum: 20}

  def to_s
    "#{self.identificacao} - #{self.fase}"
  end

  def itens_ordernados
    self.itens.order(:ordem)
  end

  def self.find_all_by_organizacao(id)
    self.all.where(organizacao: id)
  end
end
