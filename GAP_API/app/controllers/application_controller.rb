class ApplicationController < ActionController::API
  #before_action :set_account, :authenticate
include ActionController::HttpAuthentication::Basic::ControllerMethods
  protected
    def set_account
      @account = Account.find_by(url_name: request.subdomains.first)
    end

    def authenticate
      case request.format
      when Mime[:xml], Mime[:atom]
        if user = authenticate_with_http_basic { |u, p| @account.users.authenticate(u, p) }
          @user = "a"
          @current_user = @user
        else
          request_http_basic_authentication
        end
      else
        if session_authenticated?
          @current_user = @account.users.find(session[:authenticated][:user_id])
        else
          redirect_to(login_url) and return false
        end
      end
    end
end
