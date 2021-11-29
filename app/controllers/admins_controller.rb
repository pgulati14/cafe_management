class AdminsController < ApplicationController
  def index
    redirect_to new_menu_path
  end

  def manage_billers
    @billers = User.all.where(role: "clerk")
    render "biller"
  end

  def new_clerk
    render "new_clerk"
  end

  def create_clerk
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "clerk",
    )
    if new_user.save
      redirect_to manage_billers_path
    else
      flash[:error] = new_user.errors.full_messages.join(",")
      redirect_to new_clerk_path
    end
  end

  def users
    @admins = User.all.where(role: "owner")
    @billers = User.all.where(role: "clerk")
    @customers = User.all.where(role: "customer")
    render "user"
  end

  def reports
    @invoices = Order.all.where("ordered_at >= ? and ordered_at <= ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)
    if params[:from_date] && params[:to_date]
      @invoices = Order.all.where("ordered_at >= ? and ordered_at <= ?", params[:from_date].to_time.beginning_of_day, params[:to_date].to_time.end_of_day)
      if params[:username] && params[:username] != "All Users"
        if user = User.find_by(name: params[:username])
          @invoices = @invoices.all.where(user_id: user.id)
        else
          flash[:error] = "User: #{params[:username]} doesn't exist!"
        end
      end
    end
    @from_date = Date.today
    @to_date = Date.today
    @username = "All Users"
    @from_date = params[:from_date] if params[:from_date]
    @to_date = params[:to_date] if params[:to_date]
    @username = params[:username] if params[:username]
  end

  def delete_user
    user = User.find(params[:user_id])
    user.destroy
    redirect_to show_users_path
  end

  def role_change_clerk
    user = User.find(params[:user_id])
    user.update!(role: "clerk", password: user.password_digest)
    redirect_to show_users_path
  end

  def role_change_customer
    user = User.find(params[:user_id])
    user.update!(role: "customer", password: user.password_digest)
    redirect_to show_users_path
  end
end
