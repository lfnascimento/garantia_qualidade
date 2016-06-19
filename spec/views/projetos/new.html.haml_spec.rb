require 'rails_helper'

RSpec.describe "projetos/new", type: :view do
  before(:each) do
    assign(:projeto, Projeto.new(
      :nome => "MyString",
      :desc => "MyString",
      :responsavel => "MyString"
    ))
  end

  it "renders new projeto form" do
    render

    assert_select "form[action=?][method=?]", projetos_path, "post" do

      assert_select "input#projeto_nome[name=?]", "projeto[nome]"

      assert_select "input#projeto_desc[name=?]", "projeto[desc]"

      assert_select "input#projeto_responsavel[name=?]", "projeto[responsavel]"
    end
  end
end
