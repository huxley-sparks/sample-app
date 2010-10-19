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
	# creating a virtual attribute, which is not found in the database
	attr_accessor :password
	# allow outside users to modify
	attr_accessible :name, :email, :password, :password_confirmation

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# checks for presence of name, email
	validates :name, :presence => true,
						:length => { :maximum => 50 }
	validates :email, :presence => true,
						:format => { :with => email_regex },
						:uniqueness => { :case_sensitive => false }
	# automatically create the virtual attribute 'password_confirmation'
	validates :password, :presence		=> true,
						 :confirmation	=> true,
						 :length		=> {:within => 6..40 }
	before_save :encrypt_password

	private

		def encrypt_password
			self.encrypted_password = encrypt(password)
		end

		def encrypted(string)
			string # Only a temporary implementation
		end

end
