class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates :username, :presence => { :message => "You should put your ID."}
	validates :username, :uniqueness => { :message => "This ID exists already", :case_sensitive => false}
	validates :password, :length => { :minimum => 6, :too_short => "You need to have at least 6 passwords."}

end
