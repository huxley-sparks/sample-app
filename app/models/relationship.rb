class Relationship < ActiveRecord::Base
	# people can only pick who they want to follow
	attr_accessible :followed_id

	# creating relationship with followed/followed id foreign key thru user
	belongs_to :follower, :class_name => "User"
	belongs_to :followed, :class_name => "User"

	# presence must be true for relationship to be valid
	validates :follower_id,	:presence	=> true
	validates :followed_id,	:presence	=> true
end
