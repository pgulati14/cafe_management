class MenusController < ApplicationController
  def index
    render plain: "Today's Menu"
  end
end
