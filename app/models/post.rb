class Post < ActiveRecord::Base
	belongs_to :user, optional: true
	mount_uploader :image, PostImgUploader
	audited
	acts_as_votable

	validates :image, file_size: { less_than: 0.5.megabytes }
end