require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class EpPlatformAuthenticatable < Devise::Strategies::Authenticatable
      def valid?
        super || true
      end

      def authenticate!
        if params[:jwt]
        else
          fail(:invalid_login)
        end
      end
    end
  end
end

