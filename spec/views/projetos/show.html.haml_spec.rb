require 'rails_helper'

RSpec.describe "projetos/show", type: :view do
  before(:each) do
    @projeto = assign(:projeto, Projeto.create!(
      :nome => "Nome",
      :desc => "Desc",
      :responsavel => "Responsavel"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Desc/)
    expect(rendered).to match(/Responsavel/)
  end
end
