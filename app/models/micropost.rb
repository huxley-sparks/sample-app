class Micropost < ActiveRecord::Base
	# only allow this to be modifiable
	attr_accessible :content

	belongs_to :user

	validates :content, :presence => true, :length => { :maximum => 140 }
	validates :user_id, :presence => true

	default_scope	:order => 'microposts.created_at DESC'
end
