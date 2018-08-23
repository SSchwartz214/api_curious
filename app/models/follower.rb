class Follower
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:login]
  end

  def self.find_all(user)
    GitHubService.find_followers(user).map do |raw_follower|
      new(raw_follower)
    end
  end
end
