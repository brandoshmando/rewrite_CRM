class Rolodex
	def initialize
		@contacts = []
		@counter = 1000 
	end

	def add(contact)
		@contacts << contact
		contact.id = @counter +=1
	end	
end