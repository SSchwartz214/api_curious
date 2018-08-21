require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with GitHub")

    click_link "Sign in with GitHub"

    expect(page).to have_content("Seth Schwartz")
    expect(page).to have_link("Logout")
  end
end
