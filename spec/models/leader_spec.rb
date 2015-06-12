require 'rails_helper'

describe Leader do
  let(:leader) { Leader.new }
  
  describe "public instance methods" do
    it { expect(leader).to respond_to(:name) }
    it { expect(leader).to respond_to(:office) }
  end
end
