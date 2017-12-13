require 'rails_helper'

describe "User searches a zip code" do
  it "they see 10 closest stations" do
    visit '/'
    fill_in "q", with: '80203'

    click_button "Locate"
    expect(current_path).to eq('/search')
    url = URI.parse(current_url).to_s
    expect(url).to include('80203')
    expect(page).to have_content('10 Results')
    within(".stations") do
      expect(page).to have_selector(".station", count: 10)
    end

    within(first(".station")) do
      expect(page).to have_selector(".name")
      expect(page).to have_selector(".address")
      expect(page).to have_selector(".fuel_type")
      expect(page).to have_selector(".distance")
      expect(page).to have_selector(".access_times")
    end
  end
end