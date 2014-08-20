class Student < ActiveRecord::Base

	validates_length_of :first_name, :minimum => 4,
																				:format => {:with => /\A\b[a-zA-Z]+\z/}

	validates :last_name, :presence => true,
                                        :length => {:minimum => 4},
                                        :numericality => false,
                                        :uniqueness => true,
                                        :format => {:with => /\A\b[a-zA-Z]+\z/}

	FORBIDDEN_FIRSTNAMES = ["Delmer", "Elie", "Tim", "Anil"]
	FORBIDDEN_LASTNAMES = ["Reed", "Licata", "Bridgpal", "Schoppik"]
	validate :first_name_is_allowed
	validate :last_name_is_allowed

	def username_is_allowed
	    if FORBIDDEN_USERNAMES.include?(username)
	        errors.add(:first_name, "this is a user already")
	    end
	end
end
