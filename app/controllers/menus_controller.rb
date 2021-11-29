class MenusController < ApplicationController
  def index
    #render plain: Menu.all.map { |menu| menu.to_pleasant_string }.join("\n")
    @current_user = current_user
    @menus = Menu.active
    render "index"
  end

  def new
    render "new"
  end

  def show
    @current_user = current_user
    render "show"
    #id = params[:id]
    #menu_items = MenuItem.where("menu_id=?", id)
    #render plain: menu_items.all.map { |menu_item| menu_item.to_pleasant_string }.join("\n")
  end

  def create
    # id = params[:menu_id]
    name = params[:menu_name]
    Menu.create!(
      menu_name: name,
    )
    redirect_to menus_path
  end

  def destroy
    id = params[:id]
    Menu.find(id).destroy
    #redirect_to menus_path
    redirect_to new_menu_path
  end

  def edit
    @id = params[:id]
    render "edit"
  end

  def update
    id = params[:id]
    menu = Menu.find(id)
    menu.active = params[:active]
    p params[:active]
    menu.save!
    redirect_to active_menus_path
  end

  def active_menus
    render "active"
  end
end
