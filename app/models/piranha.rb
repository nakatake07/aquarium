class Piranha < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	attachment :image
end



