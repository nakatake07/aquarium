class Favorit < ApplicationRecord
	belongs_to :user
	belongs_to :piranha
	validates_uniqueness_of :piranha_id, scope: :user_id
end
