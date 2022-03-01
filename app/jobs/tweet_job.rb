class TweetJob < ApplicationJob
  queue_as :default

  def perform
    puts "Welcome"
  end
end
