class Piranha < ApplicationRecord
	belongs_to :user
	attachment :image
end
