class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :email, presence: true

         has_many :piranhas, dependent: :destroy
         has_many :buyers, dependent: :destroy
         has_many :reviews
         has_many :favorits
         attachment :image

         def already_favorited?(piranha)
          self.favorits.exists?(piranha_id: piranha.id)
         end

end
