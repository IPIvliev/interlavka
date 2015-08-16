class Article < ActiveRecord::Base
	paginates_per 5

	mount_uploader :image, ImageUploader

	has_many :comments
	belongs_to :category
	belongs_to :user
end
