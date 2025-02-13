if RUBY_VERSION.start_with?('3.0')
  require 'simplecov'
  require 'simplecov_json_formatter'
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
  SimpleCov.start
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bundler'
Bundler.setup

Dir.glob(File.expand_path('../support/**/*.rb', __FILE__)).sort.each(&method(:require))

require_relative './holodeck/holodeck.rb'
require_relative './holodeck/hologram.rb'

require 'rack'
require 'twilio-ruby'
require 'rspec/matchers'
require 'equivalent-xml'
require "reverse_coverage"  if ENV['TI']

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    @client = Twilio::REST::Client.new('AC' + 'a' * 32, 'AUTHTOKEN')
    @holodeck = Holodeck.new
    @client.http_client = @holodeck
  end
  if ENV['TI']
    config.before(:suite) do
      ReverseCoverageRspec::Main.start
    end

    config.around do |e|
      e.run
      ReverseCoverageRspec::Main.add(e)
    end

    config.after(:suite) do
      ReverseCoverageRspec::Main.save_results
    end
  end
end

def account_sid
  ENV['ACCOUNT_SID']
end

def auth_token
  ENV['AUTH_TOKEN']
end

def parse(twiml_response)
  Nokogiri::XML::Document.parse(twiml_response.to_s, &:noblanks)
end
