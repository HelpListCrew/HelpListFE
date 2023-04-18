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

	def update
		if params[:purchased]
			HelpListService.new.update_wishlist_item(session[:user_id], wishlist_item_params)
		elsif params[:recieved]

		end
	end

	private
	def wishlist_item_params
		params.permit(:id, :purchased, :received)
	end
end
