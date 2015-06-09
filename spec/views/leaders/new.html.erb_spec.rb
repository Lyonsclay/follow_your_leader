require 'rails_helper'

describe "leaders/new.html.erb" do
  before do
    render
  end
  
  it "has a name" do
    expect(rendered).to match /Follow Your Leader/
  end

  it "has a description" do
    expect(rendered).to match /Find your political representatives./
  end

  it "has a submit button" do
    expect(rendered).to match /Get Reps/
  end
end

