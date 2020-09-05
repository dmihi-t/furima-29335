class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, uniqueness: false, format: { with: /.@./ }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /[a-z]{1,}[\d]{1,}/ }
  validates :password_confirmation, presence: true
  validates :date_of_birth, prompt: false

  with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end
end
