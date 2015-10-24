require 'rails_helper'

describe LeadersController do

  describe "GET new" do
    let(:reps) { instance_double(RepsGetter) }

    it "redirects with no leaders" do
    end

    before do
      leaders = [Leader.new]

      allow(RepsGetter).to receive(:new).and_return(reps)

      allow(reps).to receive(:get).and_return(leaders)

      get :new
    end

    it "stubs" do
      expect(RepsGetter.new("some place").get).to be_a Array 
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

  describe "Post create with invalid address" do
    it "renders :new template" do
      allow(reps).to receive(:get).and_return([])

      post :create, { voter_district: { adress: "" } }

      expect(response).to render_template(:new)
    end
  end

  describe "Post create with valid address" do
    before do
      post :create, { voter_district: { address: "929 Jefferson St, Kansas City, MO 64105" } }
    end

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

    it "has no leaders" do
      expect(Leader.all.any?).to be true
    end

    it "renders :index template" do
      expect(response).to render_template(:index)
    end
  end
end
