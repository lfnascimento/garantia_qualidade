class Resposta < ActiveRecord::Base
  belongs_to :aplicacao
  belongs_to :item

  def to_s
    if self.resposta
      "Sim"
    else
      "Não"
    end
  end
end
