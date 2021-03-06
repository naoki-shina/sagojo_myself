class Article < ApplicationRecord
  belongs_to :job_tag
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
