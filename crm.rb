class CRM
	attr_accessor :name
	
	require_relative 'contact.rb'
	require_relative 'rolodex.rb'

	def initialize(name)
		@name = name
		puts "Welcome to #{name}!"
		main_menu
	end

	def main_menu
		puts "Please enter a selection from the list of options:"
		print_main_menu
		selection = gets.chomp.to_i
		option_call(selection)
	end

	def print_main_menu
		spacer
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Search contacts"
		puts "[5] Diplay all attributes"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		spacer
	end

	def spacer
		puts "--------------------------"
	end

	def option_call(selection)
	case selection
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all
		when 4 then search_for_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7 
			puts "----------Goodbye----------"
			return
		else
			puts "---Invalid Entry---"
			main_menu
		end
	end
end

CRM.new("Bitmaker")