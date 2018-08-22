class Repo

  def initialize(repo_data)
    require "pry"; binding.pry
    @name = repo_data[:name]
  end
end
