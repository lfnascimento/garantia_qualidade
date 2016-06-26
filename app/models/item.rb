class Item < ActiveRecord::Base
  belongs_to :checklist

  def to_s
    "#{self.descricao}"
  end
end
