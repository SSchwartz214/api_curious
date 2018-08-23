class User < ApplicationRecord
  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      login: auth[:extra][:raw_info][:login],
      email: auth[:info][:email],
      image: auth[:info][:image],
      name: auth[:info][:name],
      nickname: auth[:info][:nickname],
      token: auth[:credentials][:token]
    }
    user.save!
    user
  end
end
