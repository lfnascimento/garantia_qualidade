class Projeto < ActiveRecord::Base
  has_many :aplicacoes
  has_many :checklists, :through => :aplicacoes

  def to_s
    self.nome
  end
end
