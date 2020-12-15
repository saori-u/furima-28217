class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday,    presence: true
  validates :nickname,    presence: true
  validates :email,       presence: true
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name_kanji
    validates :last_name_kanji
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
