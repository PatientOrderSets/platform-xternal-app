class SessionsController < Devise::SessionsController
  protect_from_forgery except: :jwt

  def jwt

  end
end