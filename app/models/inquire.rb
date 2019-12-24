class Inquire < ApplicationRecord
	validates :name, presence: true
	validates :title, presence: true
    validates :body, presence: true
    validates :mail, presence: true

end

