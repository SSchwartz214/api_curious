require 'rails_helper'

RSpec.describe User, type: :model do
  xit "creates or updates itself from an oauth hash" do
    auth = {
      provider: "github",
      uid: "12345678",
      info: {
        email: "seth@aol.com",
        image: "https://avatars2.githubusercontent.com/u/30695131?v=4",
        name: "Seth Schwartz",
        nickname: "SSchwartz214"
      },
      credentials: {
        token: ENV[GIT_HUB_TEST_TOKEN],
      }
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("12345678")
    expect(new_user.email).to eq("seth@aol.com")
    expect(new_user.image).to eq("https://avatars2.githubusercontent.com/u/30695131?v=4")
    expect(new_user.name).to eq("Seth Schwartz")
    expect(new_user.token).to eq(ENV[GIT_HUB_TEST_TOKEN])
  end
end
