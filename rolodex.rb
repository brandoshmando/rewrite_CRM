class Rolodex
	attr_reader :contacts
	def initialize
		@contacts = []
		@counter = 1000
		@attribute_methods = [:first_name, :last_name, :email, :note, :id]
	end

	def add(contact)
		@contacts << contact
		contact.id = @counter += 1
	end

	def search(attribute_index, search_term)
		selection = @attribute_methods[attribute_index - 1]
		results = []
		@contacts.each {|contact| results << contact if contact.public_send(selection) == search_term }
		results
	end

	def modify(contact, attribute_index, new_value)
		selection = [:first_name=, :last_name=, :email=, :note=, :id=][attribute_index -1]
		contact.public_send(selection, new_value)
	end

	def puke
		@contacts
	end

	def puke_attributes(attribute_index)
		selection = @attribute_methods[attribute_index - 1]
		results = []
		@contacts.each {|contact| results << contact.public_send(selection)}
		results 
	end

	def delete(contact)
		@contacts.delete(contact)
	end	
end