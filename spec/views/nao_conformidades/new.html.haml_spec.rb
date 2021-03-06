require 'rails_helper'

RSpec.describe "nao_conformidades/new", type: :view do
  before(:each) do
    assign(:nao_conformidade, NaoConformidade.new(
      :descricao => "MyString",
      :origem => "MyString",
      :prazo => 1,
      :checklist => nil,
      :item => nil
    ))
  end

  it "renders new nao_conformidade form" do
    render

    assert_select "form[action=?][method=?]", nao_conformidades_path, "post" do

      assert_select "input#nao_conformidade_descricao[name=?]", "nao_conformidade[descricao]"

      assert_select "input#nao_conformidade_origem[name=?]", "nao_conformidade[origem]"

      assert_select "input#nao_conformidade_prazo[name=?]", "nao_conformidade[prazo]"

      assert_select "input#nao_conformidade_checklist_id[name=?]", "nao_conformidade[checklist_id]"

      assert_select "input#nao_conformidade_item_id[name=?]", "nao_conformidade[item_id]"
    end
  end
end
