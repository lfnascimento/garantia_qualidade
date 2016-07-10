class NaoConformidade < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :item
  belongs_to :user
  belongs_to :aplicacao

  alias_attribute :responsavel, :user

  def prazo_data
    data = created_at + prazo.days
    data.strftime("%d/%m/%Y")
  end
end
