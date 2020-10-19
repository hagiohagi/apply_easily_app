class User < ApplicationRecord
  include ActiveRecord::AttributeAssignment
  extend ActiveHash::Associations::ActiveRecordExtensions
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
  # step1入力項目
  validates :image,  on: :save_to_session
  validates :firstname, format: { with: PASSWORD_REGEX_ZENKAKU }, on: :save_to_session
  validates :lastname, format: { with: PASSWORD_REGEX_ZENKAKU }, on: :save_to_session
  validates :firstname_kana,format: { with: PASSWORD_REGEX_ZENKAKUKANA }, on: :save_to_session
  validates :lastname_kana,format: { with: PASSWORD_REGEX_ZENKAKUKANA }, on: :save_to_session
  validates :email,  format: { with: VALID_EMAIL_REGEX }, on: :save_to_session
  validates :sex,  on: :save_to_session
  validates :password, format: { with: PASSWORD_REGEX }, on: :save_to_session
  validates :password_confirmation, format: { with: PASSWORD_REGEX }, on: :save_to_session
  validates :birth_day,  on: :save_to_session
  validates :phone_number, format: { with: VALID_PHONE_NUMBER }, on: :save_to_session

  # step2入力項目
  validates :postal_code, format: { with: VALID_POSTAL_CODE }, on: :save_to_session_2
  validates :prefecture_id, numericality: { other_than: 0 }, on: :save_to_session_2
  validates :city,  on: :save_to_session_2

  # step3入力項目
  validates :highschool,  on: :create
  validates :h_admission,  on: :create
  validates :spouse,  on: :create
  end
end
