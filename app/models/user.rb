class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

# likes models
  has_many :likes, dependent: :destroy
  has_many :liking_articles, through: :likes, source: :article
# plofile models
  has_one  :profile, dependent: :destroy
end
