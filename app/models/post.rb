class Post < ActiveRecord::Base
	belongs_to :user, optional: true
	#has_one_attached :image
	mount_uploader :image, PostImgUploader
	audited

	validates_processing_of :image
	validate :image_size_validation
 
	private
  		def image_size_validation
    		errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  	end
end