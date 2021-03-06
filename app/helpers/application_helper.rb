module ApplicationHelper
  def current_user
    User.find_by_session_token(session[:token])
  end

  def logged_in?
    !!current_user
  end

  def get_session
    return session
  end

end
