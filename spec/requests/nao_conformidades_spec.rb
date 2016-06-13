require 'rails_helper'

RSpec.describe "NaoConformidades", type: :request do
  describe "GET /nao_conformidades" do
    it "works! (now write some real specs)" do
      get nao_conformidades_path
      expect(response).to have_http_status(200)
    end
  end
end
