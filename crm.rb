class CRM
	attr_accessor :name
	
	require_relative 'contact.rb'
	require_relative 'rolodex.rb'

	def initialize(name)
		@name = name
		@attributes = ["First Name", "Last Name", "Email", "Note"]
		@rolodex = Rolodex.new
		puts "Welcome to #{name}!"
		main_menu
	end

	def main_menu
		print_main_menu
		puts "Please enter a selection from the list of options:"
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

	def add_contact
		prompt(@attributes[0])
		first_name = gets.chomp

		prompt(@attributes[1])
		last_name = gets.chomp

		prompt(@attributes[2]) 
		email = gets.chomp

		prompt(@attributes[3])
		note = gets.chomp
		@rolodex.add(Contact.new(first_name, last_name, email, note))
	end

	def prompt(attribute)
	spacer
	puts "Please enter the #{attribute}:"
	end
end

CRM.new("Bitmaker")