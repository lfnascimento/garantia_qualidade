class Checklist < ActiveRecord::Base
  has_many :itens
  accepts_nested_attributes_for :itens
  has_many :aplicacoes
  has_many :projetos, through: :aplicacoes
end
