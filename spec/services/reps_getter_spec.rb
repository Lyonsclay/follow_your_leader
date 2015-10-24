require 'rails_helper'

describe RepsGetter do
  context "With a bad address" do
    before do 
      bad_address_file = File.read(Rails.root.join('spec/services/gapi_bad_address.json'))
      res = double()

      allow(res).to receive(:body).and_return(bad_address_file)

      allow(Net::HTTP).to receive(:get_response).and_return(res)
    end

    let(:reps) { RepsGetter.new("some place") }

    describe ".new with bad address" do
      it "returns an empty array" do
        expect(reps.get).to eq([])
      end
    end
  end

  context "With a good address" do
    before do
      file = File.read(Rails.root.join('spec/services/gapi_response.json'))
      res = double()

      allow(res).to receive(:body).and_return(file)

      allow(Net::HTTP).to receive(:get_response).and_return(res)
    end

    let(:reps) { RepsGetter.new("some place") }

    describe ".assign_offices" do
      it "returns a flat list of strings" do
        list = reps.assign_offices
        expect(list.all? { |e| e.office.class == String }).to be true
      end
    end

    describe ".create_leaders" do
      it "returns a list of RepsGetters" do
        reps.create_leaders
        expect(reps.get.all? { |e| e.class == Leader }).to be true
      end
    end

    describe ".get" do
      it "returns an aray of new RepsGetter" do
        expect(RepsGetter.new("some place").get.first).to be_a Leader
      end
    end

    describe ".set_default_photo" do
      it "sets a default image if none is received" do
        expect(reps.get.all? { |rep| rep.photoUrl.present? }).to be true
      end
    end
  end
end
