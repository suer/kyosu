class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!

  def login
    redirect_to root_path
  end

  define_method Settings.omniauth.provider do
    authhash = request.env['omniauth.auth']
    user = current_user || User.find_or_create(authhash.info.name, authhash.info.nickname)
    sign_in user, :event => :authentication
    session["oauth_credentials"] = authhash.credentials
    redirect_to(request.env['omniauth.origin'] || root_path)
  end

  def logout
    reset_session
    sign_out current_user
    redirect_to root_path
  end

  def failure
    redirect_to root_path, alert: t(:error_authentication_failed)
  end
end
