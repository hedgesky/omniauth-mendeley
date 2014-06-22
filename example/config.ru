require 'bundler'
require 'sinatra'
require 'omniauth-mendeley'

use Rack::Session::Cookie

# to register a Mendeley app sign up at http://mendeley.com/,
# then login with given credentials at http://dev.mendeley.com

MENDELEY_CONSUMER_KEY = 'your_app_key'
MENDELEY_CONSUMER_SECRET = 'your_app_secret'

use OmniAuth::Builder do
  provider :mendeley, MENDELEY_CONSUMER_KEY, MENDELEY_CONSUMER_SECRET
end

class App < Sinatra::Base
  get '/' do
    "<a href='/auth/mendeley'>Sign in via Mendeley</a>"
  end

  get '/auth/:provider/callback' do
    content_type 'text/plain'
    info = request.env['omniauth.auth'].to_hash
    MultiJson.dump(info).to_s
  end
end

run App.new