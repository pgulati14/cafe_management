class ApplicationController < ActionController::Base
  # skip_before_action :ensure_user_logged_in

  ## if current_user
  #  redirect_to menus_path
  #else
  # render "index"
  #end
  #end
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end

  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
