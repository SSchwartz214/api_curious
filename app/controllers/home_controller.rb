class HomeController < ApplicationController
  def index
    if current_user
      repo = Repo.new(current_user)
      require "pry"; binding.pry
    end
  end
end
