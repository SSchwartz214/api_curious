class User < ApplicationRecord
  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      email: auth[:info][:email],
      image: auth[:info][:image],
      name: auth[:info][:name],
      repos: auth[:extra][:raw_info][:repos_url],
      nickname: auth[:info][:nickname],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end

  # def get_repos
  #   response = Faraday.get("https://api.github.com/user/repos?access_token=#{user.token}")
  #   repo_hash = JSON.parse(response.body)
  # end
end
