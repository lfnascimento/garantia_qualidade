class Projeto < ActiveRecord::Base
  has_many :aplicacoes
  has_many :checklists, :through => :aplicacoes
  has_many :users
  accepts_nested_attributes_for :users

  def to_s
    self.nome
  end
end
