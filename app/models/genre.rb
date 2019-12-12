class Genre < ApplicationRecord
	has_many :piranhas, dependent: :destroy
end
