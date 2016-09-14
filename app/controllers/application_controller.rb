class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def already_user?
    redirect_to home_path if current_user
  end

  def find_convo
    @conversation = Conversation.find(params[:conversation_id])
  end

  helper_method :current_user, :map_keys

end
