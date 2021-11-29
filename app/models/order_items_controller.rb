class OrderItemsController < ApplicationController
  class OrderItemsController < ApplicationController
    def create
      item_ids = params[:item_ids]
      clean_item_ids = item_ids - [nil]
      Order.create!(
        user_id: current_user.id,
        date: Date.Today,
      )
      clean_item_ids.each { |item| }
      redirect_to orders_path
    end
  endend
