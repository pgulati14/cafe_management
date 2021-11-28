class MenusController < ApplicationController
  def index
        #render plain: Menu.all.map { |menu| menu.to_pleasant_string }.join("\n")
        render "index"
  end
  def show
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
end
