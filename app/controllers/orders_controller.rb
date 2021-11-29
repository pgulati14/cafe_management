class OrdersController < ApplicationController
  def create
    item_ids = params[:item_ids]
    clean_item_ids = item_ids - [nil]
  end
end
