require File.expand_path('../fruit.rb', __FILE__)
require File.expand_path('../shop.rb', __FILE__)

def register_a_fruit 
	@fruits ||= {}
	@shops ||= {}

	system "clear"

	puts "What is the name of the fruit that you would like to register?"
	fruit_name = gets.chomp.capitalize
	system "clear"
	puts "What shop is this fruit sold in?"
	shop_name = gets.chomp.capitalize

	@fruits[fruit_name] = Fruit.new(fruit_name)
	@shops[shop_name] = Shop.new(shop_name)
	@shops[shop_name].stock[fruit_name] = @fruits[fruit_name]

	welcome_menu

end

def buy_a_fruit
	system "clear"
	puts "Which fruit would you like to buy?"
	

end

def fruit_stocks
	system "clear"

	@shops.each do |key, value|
  		puts key
  		puts "-----------"
  		value.stock.each do |key, value|
  			puts "#{key} -- #{value.amount}"
  			puts
  		end
	end

	puts "press <Enter> to return to the menu"
	input = gets
	case input 
		when "\n"
			welcome_menu
		else 
			puts "press <Enter> to return to the menu"
			input = gets
	end
end


def welcome_menu
	system "clear"
	puts "Welcome to Romeo's GROCERY STORE"
	puts
	puts "Choose an operation:"
	puts "--------------------"
	puts "a.) Register a fruit"
	puts "b.) Buy a fruit"
	puts "c.) Update a fruit stock"
	puts "d.) Check fruit stocks"
	puts

	puts "Select an option: a, b, c or d"
	puts "Press Q to exit"

	loop do
		answer = gets.chomp.downcase

		case answer 

		when "a"
		 	puts "You have chosen to register a fruit"
		 	register_a_fruit
		 	break
		when "b"
			buy_a_fruit
			break
		when "c"
			puts "You have chosen to update a fruit stock"
			break
		when "d"
			fruit_stocks
			break
		when "q"
			system "exit"
			break
		else
			puts "Please choose one of the options provided"

		end
	end
end

welcome_menu


######################