require "rest_client"
require "json"

class DefinitionsController
  def self.define(message, args)
    word = args[0]

    url = "http://li572-168.members.linode.com/words.json"
    p url
    response = RestClient.post(url, {:word => word}) do |response, request, result|
      response
    end

    puts "received #{response.code}"
    if response.code == 200
      parsed = JSON.parse(response.body)
      p parsed
      parsed[word].each do |definition|
        message.reply(definition)
      end
    elsif response.code == 422
      JSON.parse(response.body)["errors"].each do |error|
        message.reply("HTTP #{response.code}: #{error}")
      end
    end
  end
end
