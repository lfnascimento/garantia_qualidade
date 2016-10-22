class Organizacao < ActiveRecord::Base
  has_many :projetos
  has_many :users
  has_many :checklists
  
  has_many :invites
  def to_s
    nome
  end
end
