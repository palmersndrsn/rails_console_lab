## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, last_name and age

 	>rails generate model Student

 and add this to migrate, probably the wrong way.
		t.string :first_name
    t.string :last_name
    t.string :age

2. Don't forget to run your migrations
	>rake db:migrate

### Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age
 	>me = Student.new
 	>me.first_name = "Palmer"
 	>me.last_name = "Sanderson"
 	>me.age = 24

2. Save the student to the database
 	>me.save

3. Using the find/set/save syntax update the student's first name to taco
	>me = Student.find(1)
	>me.first_name = "Taco"
	>me.save

4. Delete the student (where first_name is taco)
	>me = Student.find(1)
	>me.destroy

5. Validate that every Student's last name is unique

	validates_uniqueness_of :last_name

6. Validate that every Student has a first and last name that is longer than 4 characters

	validates_length_of :first_name, :minimum => 4
	validates_length_of :last_name, :minimum => 4

7. Validate that every first and last name cannot be empty

	validates_presence_of :first_name
	validates_presence_of :last_name

7. Combine all of these individual validations into one validation (using validate and a hash)

	validates_length_of :first_name, :minimum => 4

	validates :last_name, :presence => true,
                                        :length => {:minimum => 4},
                                        :numericality => false,
                                        :uniqueness => true

8. Using the create syntax create a student named John Doe who is 33 years old

	>	me5 =Student.create(:first_name=> "Ricky",:last_name=> "Bobby")

9. Show if this new student entry is valid

	> me5.valid?

10. Show the number of errors for this student instance

	> me5.errors.count

11. In one command, Change John Doe's name to Jonathan Doesmith

	> me5.update_attributes(:first_name=> "Jonathan",:last_name=> "Doesmith")

12. Clear the errors array

	> me5.errors.clear

13. Save Jonathan Doesmith

	> me5.save

15. Find all of the Students

	> Student.all

16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error

	> me7 = Student.find_by_id(128)

17. Find the first student in the table

	> me8 = Student.first

18. Find the last student in the table

	> m9 = Student.last

19. Find the student with the last name of Doesmith

	> me10 = Student.find_by_last_name("Doesmith")

20. Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order



21. Delete Jonathan Doesmith

	> Student.where("first_name" => "Jonathan","last_name" =>"Doesmith").destroy_all


### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter

 (\A\b[a-zA-Z]+\z)

2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table

		FORBIDDEN_FIRSTNAMES = ["Delmer", "Elie", "Tim", "Anil"]
	FORBIDDEN_LASTNAMES = ["Reed", "Licata", "Bridgpal", "Schoppik"]
	validate :first_name_is_allowed
	validate :last_name_is_allowed

	def first_name_is_allowed
	    if FORBIDDEN_FIRSTNAMES.include?(username)
	        errors.add(:first_name, "this is a user already")
	    end
	def last_name_is_allowed
	    if FORBIDDEN_LASTNAMES.include?(username)
	        errors.add(:first_name, "this is a user already")
	    end
	end


