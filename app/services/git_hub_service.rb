class GitHubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{@user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_starred_repos
    get_url("/users/#{@user.login}/starred")
  end

  def find_followers
    get_url("/users/#{@user.login}/followers")
  end

  def find_following
    get_url("/users/#{@user.login}/following")
  end

  def find_events
    get_url("/users/#{@user.login}/events")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_starred_repos(user)
    new(user).find_starred_repos
  end

  def self.find_followers(user)
    new(user).find_followers
  end

  def self.find_following(user)
    new(user).find_following
  end

  def self.find_events(user)
    new(user).find_events
  end
end
