require 'rails_helper'

describe "leaders/new.html.erb" do
  before do
    render
  end

  it "has a description" do
    expect(rendered).to match /Find your elected officials./
  end

  it "has a form with an id" do
    expect(rendered).to have_css('input#voter_district_address')
  end

  it "has a submit button" do
    expect(rendered).to have_button('REPS')
  end
end

