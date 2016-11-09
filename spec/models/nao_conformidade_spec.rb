require 'rails_helper'

RSpec.describe NaoConformidade, type: :model do
  subject { build(:nao_conformidade) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
