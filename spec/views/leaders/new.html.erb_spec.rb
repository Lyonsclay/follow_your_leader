require 'rails_helper'

describe "leaders/new.html.erb" do
  it "has a name" do
    render
    expect(rendered).to match /Follow Your Leader/
  end

  it "has a description" do
    render
    expect(rendered).to match /Find your political representatives./
  end
end

