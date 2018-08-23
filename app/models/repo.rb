class Repo
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:name]
  end

  def self.find_all(user)
    GitHubService.find_starred_repos(user).map do |raw_repo|
      new(raw_repo)
    end
  end
end
