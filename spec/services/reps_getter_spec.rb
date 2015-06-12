require 'rails_helper'

describe RepsGetter do
  let(:reps) { RepsGetter.new("some place") }
  file = File.read(Rails.root.join('spec/services/gapi_response.json')) 
  let(:hash) { JSON.parse(file) }
  
  before do
    allow_any_instance_of(RepsGetter).to receive(:api_call).and_return(hash)
    reps.instance_variable_set(:@hash, hash) 
    reps.instance_variable_set(:@leaders, [Leader.new])
  end

  describe ".assign_offices" do
    it "returns a flat list of strings" do
      list = reps.assign_offices
      expect(list.all? { |e| e.class == String }).to be true
    end
  end

  describe ".create_leaders" do
    it "returns a list of RepsGetters" do
      reps.create_leaders
      expect(Leader.all.all? { |e| e.class == Leader }).to be true
    end
  end
  
  describe ".get" do
    it "it returns an aray of new RepsGetter" do
      expect(RepsGetter.new("some place").get.first).to be_a Leader
    end
  end
end
