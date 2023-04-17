class KrogerFacade
  def initialize(params = {})
    @params = params
  end

  def find_items
    items = kroger_service.get_products(@params[:query])
    items[:data].map do |data|
      Item.new(data)
    end
  end

  private
  def kroger_service
    @kroger_service ||= KrogerService.new
  end
end