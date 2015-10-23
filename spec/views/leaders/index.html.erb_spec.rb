require 'rails_helper'

describe "leaders/index.html.erb" do
  before do
    @leaders = [Leader.new]
  end
  
  it "has a name" do
    render
    expect(rendered).to match /Your Elected Officials/
  end
end
