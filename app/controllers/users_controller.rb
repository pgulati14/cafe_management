class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, :only => [:create, :new]
    def new
      render "users/new"
    end

    def show
      @user = User.find(params[:id])
      render "show"
    end

    def edit
      render "edit"
    end


    def create
      User.create!(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
      )
    end
end
