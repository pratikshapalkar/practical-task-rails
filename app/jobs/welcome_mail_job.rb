class WelcomeMailJob < ApplicationJob
  include Sidekiq::Worker
  queue_as :default

  def perform(name,sec)
    p "Hey #{name}, going to sleep for #{sec}"
    sleep(sec)
  end
end
