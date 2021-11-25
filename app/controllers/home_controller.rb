class HomeController < ApplicationController
  def index
    render plain: "Hello! Guest Welcome to Our Home Page!"
  end
end
