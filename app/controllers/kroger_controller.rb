class KrogerController < ApplicationController
  def add_to_cart
		KrogerService.new.add_to_cart(session[:user_token], params[:api_item_id])
  end
end