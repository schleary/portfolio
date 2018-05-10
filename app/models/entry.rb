class Entry < ApplicationRecord

	validates :title, presence: true, length: { minimum: 5 }

	mount_uploader :image, ImageUploader

	extend FriendlyId
  	friendly_id :title, use: :slugged
	
end
