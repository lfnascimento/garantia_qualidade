require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it "to_s" do
    expect(subject.to_s).to eq "Luís Nascimento - luisnascimento@mail.com"
  end
end
