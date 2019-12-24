class Buyer < ApplicationRecord

	validates :title, presence: true
    validates :body, presence: true
    validates :genre_id, presence: true


	belongs_to :user
	belongs_to :genre
	attachment :image
end


