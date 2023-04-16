class SearchController < ApplicationController
  def index
    @kroger_facade = KrogerFacade.new(params)
  end
end