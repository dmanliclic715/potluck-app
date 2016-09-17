helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def authorized!(user)
    redirect '/' unless session[:user_id] == user.id
  end
end
