class Shop
	attr_accessor :name, :stock

	def initialize(name)
		@name = name
		@stock = {}
	end

end