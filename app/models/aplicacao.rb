class Aplicacao < ActiveRecord::Base
  belongs_to :projeto
  belongs_to :checklist
end
