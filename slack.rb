require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load
module Clockwork
  client = SlackNotify::Client.new(
    webhook_url: ENV['slack'],
    channel: "#general",
    username: "mybot",
    icon_url: "http://mydomain.com/myimage.png",
    icon_emoji: ":shipit:",
    link_names: 1
    )
  every(3.minutes, "Hello There!") do
    client.notify("Hello There!#{Time.current.strftime('%Y/%m/%d %H:%M:%S')}")
  end
end