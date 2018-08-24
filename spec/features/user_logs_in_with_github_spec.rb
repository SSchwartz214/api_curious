require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth
    mock_starred_repos = '[{"id": 144638183,"name": "rales_engine"},
                          {"id": 143650074, "name": "bike_share"}
                        ]'

    stub_request(:get, "https://api.github.com/users/SSchwartz214/starred").
    to_return(status: 200, body: mock_starred_repos)

    stub_request(:get, "https://api.github.com/users/SSchwartz214/followers").
    to_return(status: 200, body: mock_starred_repos)

    stub_request(:get, "https://api.github.com/users/SSchwartz214/following").
    to_return(status: 200, body: mock_starred_repos)

    visit root_path

    expect(page).to have_link("Sign in with GitHub")

    click_link "Sign in with GitHub"

    expect(page).to have_content("Seth Schwartz")
    expect(page).to have_link("Logout")


    expect(page).to have_content("Number of Starred Repositories: 2")

    # within (".info") do
    #   expect(page).to have_css(".followers", count: 3)
    #   expect(page).to have_css(".following", count: 4)
    # end
  end
end
