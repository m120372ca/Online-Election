class Candidate < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :constituency
	validates_presence_of :votes
	validates_numericality_of :votes , :only_integer => true
	validates_presence_of :party
end
