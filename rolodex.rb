class Rolodex
	def initialize
		@contacts = []
		@counter = 1000 
	end

	def add(contact)
		@contacts << contact
		contact.id = @counter +=1
	end
	def search(attribute_index, search_term)
		search_attribute = [:first_name, :last_name, :email, :note, :id][attribute_index - 1]
		results = []
		@contacts.each {|contact| results << contact if contact.public_send(selection) == search_term }
		results
	end
		
end