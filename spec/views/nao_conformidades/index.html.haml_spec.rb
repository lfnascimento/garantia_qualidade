require 'rails_helper'

RSpec.describe "nao_conformidades/index", type: :view do
  before(:each) do
    assign(:nao_conformidades, [
      NaoConformidade.create!(
        :descricao => "Descricao",
        :origem => "Origem",
        :prazo => 1,
        :checklist => nil,
        :item => nil
      ),
      NaoConformidade.create!(
        :descricao => "Descricao",
        :origem => "Origem",
        :prazo => 1,
        :checklist => nil,
        :item => nil
      )
    ])
  end

  it "renders a list of nao_conformidades" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Origem".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
