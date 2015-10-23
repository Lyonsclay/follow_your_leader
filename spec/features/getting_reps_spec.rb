require "rails_helper"

feature "Getting reps" do
  let(:leader) { Leader.new(name: "tony") }
  let(:address) { "1600 Pennsylvania Ave." }

  before do
    Rails.cache.clear
    reps_getter = instance_double("RepsGetter")
    allow(RepsGetter).to receive(:new).with(address).and_return(reps_getter)
    allow(reps_getter).to receive(:get).and_return([leader])

    visit root_path
  end
   
  scenario "visits root" do
    expect(page).to have_button "REPS"
  end

  scenario "visits leaders page" do
    fill_in("voter_district_address", with: address)

    click_button "REPS"

    expect(page).to have_text "tony"
  end

  scenario "displays a prefilled address", js: true do 
    # a = page.driver.browser.switch_to.alert
    # a.accept

    # page.accept_alert 'Would you like to share your location with this site?' do
    #   click_button('Share Location')
    # end

    # wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
    # alert = wait.until { page.driver.browser.switch_to.alert }
    # alert.accept

    # expect(find('input', match: :first).text).to have_content
  end
end
