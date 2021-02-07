class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
    validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers'}
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: 'Full-width characters'} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,  format: {with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
    validates :last_name_katakana
    validates :first_name_katakana
  end
end
