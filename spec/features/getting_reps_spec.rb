require "rails_helper"

feature "Getting reps" do
  let(:leader) { Leader.new(name: "tony") }
  before do
    allow(RepsGetter).to receive(:get).and_return([leader])

    visit root_path
    click_on "Get Reps"
  end
  
  scenario "visits leaders page" do
    expect(page).to have_content "tony" 
  end
end
