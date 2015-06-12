require 'rails_helper'

describe LeadersController do
  
  describe "GET new" do
    let(:reps) { instance_double(RepsGetter) }
    
    before do
      leaders = [Leader.new]
      allow(RepsGetter).to receive(:new).and_return(reps)
      allow_any_instance_of(RepsGetter).to receive(:get).
                                            and_return(leaders)
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

  describe "Post create" do
    before do
      post :create, { voter_district: { address: "2020 Hillborne ln, Kansas City KS" } }
    end

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end
 
    it "has no leaders" do
      expect(Leader.all).to match_array([])
    end
    
    it "renders :index template" do
      expect(response).to render_template(:index)
    end

    context "create a new Leader" do
      it "has a leader" do
        leader = Leader.new
        expect(Leader.all).to match_array([leader])
      end
    end
  end
end
