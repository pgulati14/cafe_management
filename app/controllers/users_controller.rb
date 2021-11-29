class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password_digest: params[:password_digest],

    )
    redirect_to "/"
  end

  def show
    @user = User.find(params[:id])
    render "show"
  end
end
