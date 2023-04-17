class WishlistItemsController < ApplicationController
  def index

  end

  def create
    HelpListService.new.create_wishlist_item({api_item_id: params[:item_id], 
																							recipient_id: current_user.id, 
																							name: params[:name], 
																							price: params[:price],
																							size: params[:size],
																							image_path: params[:image_path]})

    redirect_to dashboard_path
  end
end
