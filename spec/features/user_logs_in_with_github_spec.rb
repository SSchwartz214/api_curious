require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    def stub_omniauth
      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: "github",
        uid: "12345678",
        info: {
          email: "seth@aol.com",
          image: "https://avatars2.githubusercontent.com/u/30695131?v=4",
          name: "Seth Schwartz",
          nickname: "SS"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now,
        }
      })
    end

    visit root_path

    expect(page).to have_link("Sign in with GitHub")

    click_link "Sign in with GitHub"

    expect(page).to have_content("Seth Schwartz")
    expect(page).to have_link("Logout")
  end
end
