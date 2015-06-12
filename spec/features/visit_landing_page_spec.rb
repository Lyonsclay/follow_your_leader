require "rails_helper"

feature "Getting reps" do
  before(:each) do
    visit root_path
    leaders = [Leader.new]
    allow(RepsGetter).to receive(:get).and_return(leaders)
  end
  
  scenario "it can be stubbed" do
    expect(RepsGetter.get("Ibiza").count).to eq(1)
  end
  
  scenario "displays the title" do
    expect(page).to have_content('Follow Your Leader')
  end

  scenario "displays a prefilled address", js: true do 
    expect(find('input', match: :first).text).to have_content
  end

  scenario "has a Get Reps button" do
    expect(page).to have_selector("input[type=submit][value='Get Reps']")
  end
  
  scenario "clicks Get Reps" do
    click_button "Get Reps"
    expect(current_path).to eq leaders_path
  end
end
