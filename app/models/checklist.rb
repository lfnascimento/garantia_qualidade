class Checklist < ActiveRecord::Base
  has_many :itens
  accepts_nested_attributes_for :itens
  has_many :aplicacoes
  has_many :projetos, through: :aplicacoes

  def to_s
    "#{self.identificacao} - #{self.fase}"
  end

  def itens_ordernados
    self.itens.order(:ordem)
  end
end
