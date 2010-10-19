# == Schema Information
# Schema version: 20101019163605
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	# allow outside users to modify
	attr_accessible :name, :email

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# checks for presence of name, email
	validates :name, :presence => true,
						:length => { :maximum => 50 }
	validates :email, :presence => true,
						:format => { :with => email_regex },
						:uniqueness => { :case_sensitive => false }

end
