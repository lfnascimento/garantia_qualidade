require 'rails_helper'

RSpec.describe "organizacoes/edit", type: :view do
  before(:each) do
    @organizacao = assign(:organizacao, Organizacao.create!(
      :nome => "MyString",
      :descricao => "MyText",
      :logo => "MyString"
    ))
  end

  it "renders the edit organizacao form" do
    render

    assert_select "form[action=?][method=?]", organizacao_path(@organizacao), "post" do

      assert_select "input#organizacao_nome[name=?]", "organizacao[nome]"

      assert_select "textarea#organizacao_descricao[name=?]", "organizacao[descricao]"

      assert_select "input#organizacao_logo[name=?]", "organizacao[logo]"
    end
  end
end
