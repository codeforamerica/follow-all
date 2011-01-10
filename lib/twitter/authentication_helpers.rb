module Twitter
  module AuthenticationHelpers

    def store_location
      session[:return_to] = request.request_uri if request.get?
    end

    def deny_access
      store_location
      render :template => "/sessions/new", :status => :unauthorized
    end

    def sign_in(user)
      session[:screen_name] = user.screen_name if user
    end

    def signed_in?
      !session[:screen_name].nil?
    end

    def authenticate
      deny_access unless signed_in?
    end

    def redirect_back_or(default)
      session[:return_to] ||= params[:return_to]
      if session[:return_to]
        redirect_to(session[:return_to])
      else
        redirect_to(default)
      end
      session[:return_to] = nil
    end
  end
end
