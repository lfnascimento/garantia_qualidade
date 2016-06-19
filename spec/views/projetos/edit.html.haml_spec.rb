require 'rails_helper'

RSpec.describe "projetos/edit", type: :view do
  before(:each) do
    @projeto = assign(:projeto, Projeto.create!(
      :nome => "MyString",
      :desc => "MyString",
      :responsavel => "MyString"
    ))
  end

  it "renders the edit projeto form" do
    render

    assert_select "form[action=?][method=?]", projeto_path(@projeto), "post" do

      assert_select "input#projeto_nome[name=?]", "projeto[nome]"

      assert_select "input#projeto_desc[name=?]", "projeto[desc]"

      assert_select "input#projeto_responsavel[name=?]", "projeto[responsavel]"
    end
  end
end
