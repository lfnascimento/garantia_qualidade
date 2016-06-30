class Item < ActiveRecord::Base
  belongs_to :checklist
  has_many :respostas

  def to_s
    "#{self.descricao}"
  end

  def tipo
    if self.produto? && self.processo?
      "Produto e Processo"
    elsif self.produto?
      "Produto"
    elsif self.processo?
      "Processo"
    else
      "Item indefinido"
    end
  end

end
