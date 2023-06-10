class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\u{30fc}]+\z/.freeze
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数字を混合して入力してください' }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: '全角（漢字・かな・カナ）で入力してください' }
  validates :first_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: '全角（漢字・かな・カナ）で入力してください' }
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: '全角カナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: '全角カナで入力してください' }
  validates :birth_date, presence: true
end
