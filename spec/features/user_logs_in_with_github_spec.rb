require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with GitHub")

    click_link "Sign in with GitHub"

    expect(page).to have_content("Seth Schwartz")
    expect(page).to have_link("Logout")


    expect(page).to have_content("Number of Starred Repositories: 2")

    within (".info") do
      expect(page).to have_css(".followers", count: 3)
      expect(page).to have_css(".following", count: 4)
    end
  end
end
