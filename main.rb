require "reginald"
require_relative "controllers/controllers.rb"

reggie = Reginald::Reginald.new(
  :xmpp_user => ENV["XMPP_USERNAME"],
  :xmpp_password => ENV["XMPP_PASSWORD"],
  :twilio_account_id => ENV["TWILIO_ACCOUNT_ID"],
  :twilio_auth_token => ENV["TWILIO_AUTH_TOKEN"],
  :twilio_from_number => ENV["TWILIO_FROM_NUMBER"],
)

reggie.listen(/define (\w+)/i, "definitions_controller#define")
reggie.listen(/ping/i, "ping_controller#pong")

t1, t2 = reggie.run

t1.join
