class CRM
	attr_accessor :name
	
	require_relative 'contact.rb'
	require_relative 'rolodex.rb'

	def initialize(name)
		@name = name
		@attributes = ["First Name", "Last Name", "Email", "Note", "ID"]
		@rolodex = Rolodex.new
		@rolodex.add(Contact.new("Brandon","Craft", "Email", "Note"))
		@rolodex.add(Contact.new("Brandon","Craft", "Email", "Note"))
		@rolodex.add(Contact.new("Rob","Ford", "loves_crack77@hotmail.com", "He crayyyy"))
		@rolodex.add(Contact.new("Tester","McGee", "Email", "Note"))
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
		when 4 then search_contacts
		when 5 then display_attributes
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

	def search_contacts
		print_attribute_list
		puts "Please select which attribute you would like to search by:"
		attribute_index = gets.chomp.to_i
		prompt(@attributes[attribute_index -1])
		search_term = gets.chomp
		results = @rolodex.search(attribute_index, search_term)
		if @rolodex.contacts.empty?
			empty_error
		elsif results.empty?
			puts "Your search returned no results. Press enter to return to the Main Menu"
			gets.chomp
		elsif results.size == 1
			contact_card(results)
		else
			list_results(results)
			puts "Please select the contact you would like to display:"
			selection = gets.chomp.to_i
			contact_selection = []
			contact_selection << results[selection - 1]
			contact_card(contact_selection)
		end
		main_menu
	end

	def print_attribute_list
		spacer
		@attributes.each_with_index { |attribute, index| puts "[#{index + 1}] #{attribute}"}
		spacer
	end

	def contact_card(array)
		array.each do |contact|
			spacer
				puts "#{@attributes[0]}: #{contact.first_name}"
				puts "#{@attributes[1]}: #{contact.last_name}"
				puts "#{@attributes[2]}: #{contact.email}"
				puts "#{@attributes[3]}: #{contact.note}"
				puts "#{@attributes[4]}: #{contact.id}"
			spacer
		end
	end

	def list_results(array)
		array.each_with_index do |match, index|
			spacer
				puts "[#{index + 1}]  |First Name: #{match.first_name} | Last Name: #{match.last_name} | Email Address: #{match.email} | Notes: #{match.note} | ID: #{match.id}"
			spacer
		end
	end

	def modify_contact
		contact = search_contacts
		print_attribute_list
		puts "Please select the attribute you would like to modify"
		attribute_index = gets.chomp
		puts "Please enter the modified attribute:"
		new_value = gets.chomp
		@rolodex.modify(contact, attribute_index, new_value)
	end

	def display_all
		results = @rolodex.puke
		results.empty? ? empty_error : contact_card(results)
		main_menu
	end

	def empty_error
		puts "#{@name} is currently empty. Please add a contact and try again!"
		main_menu
	end

	def display_attributes
		print_attribute_list
		puts "Select the attribute would you like to display:"
		attribute_index = gets.chomp.to_i
		results = @rolodex.puke_attributes(attribute_index)
		attribute_format(results)
	end

	def attribute_format(array)
		if array.empty?
			empty_error
		else
			array.each_with_index do |attribute, index|
				puts "[#{index}]  | #{attribute}"
			end
			main_menu
		end
	end
end

CRM.new("Bitmaker")