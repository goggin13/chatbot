require "rest_client"
require "json"

class PingController
  def self.pong(message, args)
    message.reply("pong")
  end
end
