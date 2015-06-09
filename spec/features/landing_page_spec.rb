require "rails_helper"

feature "Visiting the landing page" do
  before do
    visit root_path
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
  
  scenario "visits leaders" do
    click_button "Get Reps"
    expect(current_path).to eq leaders_path
  end
end
