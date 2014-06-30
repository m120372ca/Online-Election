class Voter < ActiveRecord::Base
	
	validates_presence_of :name
	validates_presence_of :constituency
	validates_presence_of :password
	  
end
