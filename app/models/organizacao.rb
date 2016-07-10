class Organizacao < ActiveRecord::Base
  has_many :projetos
  has_many :users
  has_many :checklists

  def to_s
    nome
  end
end
