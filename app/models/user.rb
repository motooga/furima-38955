class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_name, presence: true
  validates :birthday, presence: true

end
