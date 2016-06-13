require 'rails_helper'

RSpec.describe "nao_conformidades/show", type: :view do
  before(:each) do
    @nao_conformidade = assign(:nao_conformidade, NaoConformidade.create!(
      :descricao => "Descricao",
      :origem => "Origem",
      :prazo => 1,
      :checklist => nil,
      :item => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(/Origem/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
