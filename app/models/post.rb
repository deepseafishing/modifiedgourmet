class Post < ActiveRecord::Base
	belongs_to :user
has_many :comments
validates :category, :inclusion => {:in => ["Korean Foods", "Japanese Foods", "Chinese Foods", "Western Foods"], :message => "Choose at least one among Korean Foods, Japanese Foods, Chinese Foods, Western Foods."}
validates :title, :presence => { :message => "Please write the title"}

    mount_uploader :image, ImageUploader
  end
