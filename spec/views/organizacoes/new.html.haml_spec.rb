require 'rails_helper'

RSpec.describe "organizacoes/new", type: :view do
  before(:each) do
    assign(:organizacao, Organizacao.new(
      :nome => "MyString",
      :descricao => "MyText",
      :logo => "MyString"
    ))
  end

  it "renders new organizacao form" do
    render

    assert_select "form[action=?][method=?]", organizacoes_path, "post" do

      assert_select "input#organizacao_nome[name=?]", "organizacao[nome]"

      assert_select "textarea#organizacao_descricao[name=?]", "organizacao[descricao]"

      assert_select "input#organizacao_logo[name=?]", "organizacao[logo]"
    end
  end
end
