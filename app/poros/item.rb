class Item
  attr_reader :id,
              :categories,
              :brand,
              :description,
              :image_url,
              :price,
              :size

  def initialize(data)
    @id = data[:productId]
    @categories = data[:categories]
    @brand = data[:brand]
    @description = data[:description]
    @image_url = data[:images].first[:sizes].third[:url]
    @price = data[:items].first[:price][:regular]
    @size = data[:items].first[:size]
  end
end