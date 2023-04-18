class HelpListItem
	attr_reader :id,
							:api_item_id,
							:image_path,
							:name,
							:price,
							:size

	def initialize(data)
		@id = data[:id]
		@api_item_id = data[:attributes][:api_item_id]
		@name = data[:attributes][:name]
		@price = data[:attributes][:price]
		@image_path = data[:attributes][:image_path]
		@size = data[:attributes][:size]
	end
end