class Following
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:login]
  end

  def self.find_all(user)
    GitHubService.find_following(user).map do |raw_following|
      new(raw_following)
    end
  end
end
