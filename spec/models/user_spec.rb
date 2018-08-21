require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
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
    }
    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("12345678")
    expect(new_user.email).to eq("seth@aol.com")
    expect(new_user.image).to eq("https://avatars2.githubusercontent.com/u/30695131?v=4")
    expect(new_user.name).to eq("Seth Schwartz")
    expect(new_user.token).to eq("abcdefg12345")
    expect(new_user.refresh_token).to eq("12345abcdefg")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end
