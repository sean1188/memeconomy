class Post < ActiveRecord::Base
	belongs_to :user, optional: true
	mount_uploader :image, PostImgUploader
	has_one_attached :image
	has_many :comments, dependent: :destroy
	audited
	acts_as_votable

	validates :image, file_size: { less_than: 0.5.megabytes }
end