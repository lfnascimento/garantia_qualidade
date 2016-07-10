require 'rails_helper'

RSpec.describe "organizacoes/index", type: :view do
  before(:each) do
    assign(:organizacoes, [
      Organizacao.create!(
        :nome => "Nome",
        :descricao => "MyText",
        :logo => "Logo"
      ),
      Organizacao.create!(
        :nome => "Nome",
        :descricao => "MyText",
        :logo => "Logo"
      )
    ])
  end

  it "renders a list of organizacoes" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
  end
end
