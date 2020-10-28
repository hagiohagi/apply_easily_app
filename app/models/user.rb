class User < ApplicationRecord
  include ActiveRecord::AttributeAssignment
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :parttime
  has_one_attached :image
  accepts_nested_attributes_for :parttime
  belongs_to_active_hash :prefecture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_ZENKAKU = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  PASSWORD_REGEX_ZENKAKUKANA = /\A[ぁ-んァ-ヶー－]+\z/.freeze
  VALID_PHONE_NUMBER = /\A\d{10,11}\z/.freeze
  VALID_POSTAL_CODE = /\A\d{7}\z/.freeze

  with_options presence: true do

    validates :firstname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :lastname, format: { with: PASSWORD_REGEX_ZENKAKU }
    validates :firstname_kana, format: { with: PASSWORD_REGEX_ZENKAKUKANA }
    validates :lastname_kana, format: { with: PASSWORD_REGEX_ZENKAKUKANA }
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :sex
    validates :password, length: { minimum: 8 }, format: { with: PASSWORD_REGEX }
    validates :password_confirmation, length: { minimum: 8 }, format: { with: PASSWORD_REGEX }
    validates :birth_day
    validates :phone_number, format: { with: VALID_PHONE_NUMBER }
    validates :postal_code, format: { with: VALID_POSTAL_CODE }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :highschool
    validates :h_admission
    validates :station
    validates :spouse
  end
end
