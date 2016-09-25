class Item < ActiveRecord::Base
  belongs_to :checklist
  has_many :respostas

  validates :descricao, presence: true
  validate :pertence_produto_processo

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

  private
    def pertence_produto_processo
      unless produto || processo
        errors.add(:base, "Produto, Processo ou ambos devem ser escolhidos")
      end
    end

end
