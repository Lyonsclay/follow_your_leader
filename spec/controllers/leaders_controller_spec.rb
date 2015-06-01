require 'rails_helper'

describe LeadersController do
 
  describe "GET new" do
    before do
      get :new
    end

     it "has a 200 status code" do
      expect(response.status).to eq(200)
    end
    
    it "assigns @voter_district" do
      expect(assigns(:voter_district)).to be_invalid
    end

    it "renders :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "Post create" do
    before do
      post :create
    end

    it "renders :index template" do
      expect(response.status).to eq(200)
    end
  end
end
