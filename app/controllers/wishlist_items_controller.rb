class WishlistItemsController < ApplicationController
  def index

  end

  def create
    HelpListService.new.create_wishlist_item({api_item_id: params[:item_id], recipient_id: current_user.id})

    redirect_to dashboard_path
  end
end
