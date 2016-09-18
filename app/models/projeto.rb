class Projeto < ActiveRecord::Base
  has_many :aplicacoes
  has_many :checklists, :through => :aplicacoes
  has_many :users
  accepts_nested_attributes_for :users
  belongs_to :organizacao

  alias_attribute :responsaveis, :users

  validates :nome, :responsaveis, presence: true

  def to_s
    self.nome
  end

  def self.find_all_by_organizacao(id)
    self.all.where(organizacao: id)
  end
end
