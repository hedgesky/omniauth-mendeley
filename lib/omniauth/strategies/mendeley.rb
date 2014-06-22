require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Mendeley < OmniAuth::Strategies::OAuth2

      # http://dev.mendeley.com/html/authentication.html
      # Mendeley currently supports only 'all' value
      DEFAULT_SCOPE = 'all'

      option :name, 'mendeley'

      option :client_options, {
        :site           => 'https://mix.mendeley.com',
        :token_path     => '/oauth/token/',
        :authorize_path => '/oauth/authorize/',
      }

      uid do
        raw_info['id']
      end

      info do
        {
          :name       => raw_info['display_name'],
          :first_name => raw_info['first_name'],
          :last_name  => raw_info['last_name'],
          :email      => raw_info['email'],
          :image      => raw_info['photo']['standard'],
          :urls       => {
            'mendeley' => raw_info['link']
          }
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/profiles/me').body)
      end


      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

    end
  end
end
