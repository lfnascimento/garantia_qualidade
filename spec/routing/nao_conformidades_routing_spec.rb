require "rails_helper"

RSpec.describe NaoConformidadesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nao_conformidades").to route_to("nao_conformidades#index")
    end

    it "routes to #new" do
      expect(:get => "/nao_conformidades/new").to route_to("nao_conformidades#new")
    end

    it "routes to #show" do
      expect(:get => "/nao_conformidades/1").to route_to("nao_conformidades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nao_conformidades/1/edit").to route_to("nao_conformidades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nao_conformidades").to route_to("nao_conformidades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nao_conformidades/1").to route_to("nao_conformidades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nao_conformidades/1").to route_to("nao_conformidades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nao_conformidades/1").to route_to("nao_conformidades#destroy", :id => "1")
    end

  end
end
