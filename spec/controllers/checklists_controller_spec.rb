require 'rails_helper'

describe ChecklistsController, :type => :controller do
  
  describe 'POST :create' do
    it "saves a newly created checklist" do
      checklist = FactoryGirl.attributes_for(:checklist)
      post :create, { checklist: checklist }
      expect(assigns(:checklist)).to be_persisted
    end
  end
end
