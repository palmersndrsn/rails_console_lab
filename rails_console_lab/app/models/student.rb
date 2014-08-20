class Student < ActiveRecord::Base

	validates_length_of :first_name, :minimum => 4

	validates :last_name, :presence => true,
                                        :length => {:minimum => 4},
                                        :numericality => false,
                                        :uniqueness => true
end
