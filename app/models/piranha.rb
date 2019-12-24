class Piranha < ApplicationRecord
	validates :title, presence: true
    validates :body, presence: true
    validates :genre_id, presence: true


	belongs_to :user
	belongs_to :genre
	has_many :reviews
	has_many :favorits
	has_many :favorited_users, through: :favorits, source: :user
    attachment :image
end



