require 'rails_helper'

RSpec.describe "organizacoes/show", type: :view do
  before(:each) do
    @organizacao = assign(:organizacao, Organizacao.create!(
      :nome => "Nome",
      :descricao => "MyText",
      :logo => "Logo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Logo/)
  end
end
