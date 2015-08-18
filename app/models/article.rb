class Article < ActiveRecord::Base
	paginates_per 5

	mount_uploader :image, ImageUploader

	has_many :comments, dependent: :destroy
	belongs_to :category
	belongs_to :user

	extend FriendlyId
	friendly_id :name, use: :slugged
end
