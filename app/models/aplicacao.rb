class Aplicacao < ActiveRecord::Base
  belongs_to :projeto
  belongs_to :checklist
  has_many :respostas
  has_many :nao_conformidades

  def self.find_all_by_organizacao(id)
    self.joins(checklist: :organizacao).where("organizacoes.id = ?", id)
  end

  def to_s
    "#{checklist} - #{created_at.strftime('%d/%m/%Y')}"
  end
end
