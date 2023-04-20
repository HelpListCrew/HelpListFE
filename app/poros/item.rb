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
    @image_url = find_front_image(data[:images])
    @price = get_price(data)
    @size = data[:items].first[:size]
  end

  private
  def find_front_image(image_json)
    front_perspective = image_json.select do |image| 
      image[:perspective] == "front"
    end
    
    front_perspective[0][:sizes].select { |size| size[:size] == "medium" }.first[:url]
  end

  def get_price(data)
    begin
      data[:items].first[:price][:regular]
    rescue => e
      "Unavailable"
    end
  end
end