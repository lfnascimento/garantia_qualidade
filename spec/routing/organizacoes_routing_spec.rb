require "rails_helper"

RSpec.describe OrganizacoesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/organizacoes").to route_to("organizacoes#index")
    end

    it "routes to #new" do
      expect(:get => "/organizacoes/new").to route_to("organizacoes#new")
    end

    it "routes to #show" do
      expect(:get => "/organizacoes/1").to route_to("organizacoes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/organizacoes/1/edit").to route_to("organizacoes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizacoes").to route_to("organizacoes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/organizacoes/1").to route_to("organizacoes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/organizacoes/1").to route_to("organizacoes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/organizacoes/1").to route_to("organizacoes#destroy", :id => "1")
    end

  end
end
