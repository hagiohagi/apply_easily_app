class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         validates :firstname, :lastname, presence: true
         validates :password, presence: true, length: { minimum: 8 }, format: { with: PASSWORD_REGEX }
         validates :password_confirmation, presence: true, length: { minimum: 8 }
end
