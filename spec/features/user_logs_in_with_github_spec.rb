require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    json_response_1 = File.open("./fixtures/starred_repos.json")
    stub_request(:any, "https://api.github.com/users/SSchwartz214/starred").
    to_return(status: 200, body: json_response_1)

    json_response_2 = File.open("./fixtures/followers.json")
    stub_request(:any, "https://api.github.com/users/SSchwartz214/followers").
    to_return(status: 200, body: json_response_2)

    json_response_3 = File.open("./fixtures/following.json")
    stub_request(:any, "https://api.github.com/users/SSchwartz214/following").
    to_return(status: 200, body: json_response_3)

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
