class HomeController < ApplicationController
  def index
    if current_user
      @repos = Repo.find_all(current_user)
      @followers = Follower.find_all(current_user)
    end
  end
end
