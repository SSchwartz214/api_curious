class GitHubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{@user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_repos
    response = @conn.get("/users/#{@user.nickname}/repos")
    require "pry"; binding.pry
    results = JSON.parse(response.body, symbolize_names: true)[:extra][:raw_info][:repos_url]

    @repos = results.map do |result|
      Repo.new(result)
    end
  end
end
