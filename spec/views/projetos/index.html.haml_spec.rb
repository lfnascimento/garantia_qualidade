require 'rails_helper'

RSpec.describe "projetos/index", type: :view do
  before(:each) do
    assign(:projetos, [
      Projeto.create!(
        :nome => "Nome",
        :desc => "Desc",
        :responsavel => "Responsavel"
      ),
      Projeto.create!(
        :nome => "Nome",
        :desc => "Desc",
        :responsavel => "Responsavel"
      )
    ])
  end

  it "renders a list of projetos" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Responsavel".to_s, :count => 2
  end
end
