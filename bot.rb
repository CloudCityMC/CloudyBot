# CloudyBot IRC Bot

# Require Gems needed to run programs and plugins
begin
  require 'cinch'
rescue LoadError
  puts "You're missing the gem `cinch`. Installing..."
  `gem install cinch`
  puts 'Gem installed! Continuing..'
end
begin
  require 'restclient'
rescue LoadError
  puts "You're missing the gem `rest-client`. Installing..."
  `gem install rest-client`
  puts 'Gem installed! Continuing..'
end
require 'json'
require 'net/http'
require 'yaml'
require 'open-uri'

# Require each plugin
Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

# Configure the Bot
bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from pre-config
    c.nick = 'CloudyBot'
    c.server = 'irc.chew.chat'
    c.channels = ["#CloudCity,#CloudyBot"]
    c.port = '6697'
    c.user = 'CloudyBot'
    c.realname = 'Bot for #CloudCity'
    c.messages_per_second = 5
    c.ssl.use = 'true'
    c.plugins.prefix = /@/

    # Load modules.
    c.plugins.plugins = [Links]
  end
end
# START THE BOT
bot.start
