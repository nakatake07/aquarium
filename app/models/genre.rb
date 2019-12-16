class Genre < ApplicationRecord
	has_many :piranhas, dependent: :destroy
	has_many :buyers, dependent: :destroy
end
