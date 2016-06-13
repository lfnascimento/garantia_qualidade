class NaoConformidade < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :item
end
