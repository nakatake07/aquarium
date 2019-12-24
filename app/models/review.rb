class Review < ApplicationRecord

	validates :review_body, presence: true

	belongs_to :user
	belongs_to :piranha
	validates :review_body, presence: true
end
