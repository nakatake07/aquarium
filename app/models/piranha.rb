class Piranha < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :reviews
	has_many :favorits
	has_many :favorited_users, through: :favorits, source: :user
    attachment :image
end



