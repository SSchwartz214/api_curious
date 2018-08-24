class Event
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:messages]
  end

  def self.find_all(user)
    GitHubService.find_events(user).map do |raw_event|
      new(raw_event)
    end
  end
end
