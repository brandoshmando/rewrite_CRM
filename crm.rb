class CRM
	def main_menu
		puts "Please enter a selection from the list below:"
		print_main_menu
		selection = gets.chomp.to_i
		option_call(selection -1)
	end

	def option_call(selection)
	case selection
	when 0 then add_contact
	when 1 then modify_contact
	when 2 then display_all
	when 3 then search_for_contact
	when 4 then display_attribute
	when 5 then delete_contact
	when 6 
		puts "---Goodbye---"
		return
	else
		puts "---Invalid Entry---"
		main_menu
	end


end