class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def edit
    render "edit"
  end

  def update
    user = User.find(params[:id])
    if user && user.authenticate(params[:password])
      user.update!(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      if !user.save
        flash[:error] = user.errors.full_messages.join(",")
      end
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid Password"
      redirect_to edit_user_path(@current_user.id)
    end
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "customer",
    )
    if new_user.save
      new_user.update!(name: new_user.first_name.to_s + new_user.last_name.to_s,
                       password: params[:password])
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(",")
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    render "show"
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy
    redirect_to manage_billers_path
  end
end
