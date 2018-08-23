class GitHubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{@user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_repos
    get_url("/users/#{@user.nickname}/repos")
  end

  def find_followers
    get_url("/users/#{@user.nickname}/followers")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_repos(user)
    new(user).find_repos
  end

  def self.find_followers(user)
    new(user).find_followers
  end

  #   @repos = results.map do |result|
  #     Repo.new(result)
  #   end
  # end
end
