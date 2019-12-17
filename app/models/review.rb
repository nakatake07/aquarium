class Review < ApplicationRecord
	belongs_to :user
	belongs_to :piranha
	validates :review_body, presence: true
end
