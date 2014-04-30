class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :content, :presence => { :message => "Please fill out the comment."}
end
