class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  has_many :matchings
  has_many :matching_users, through: :matchings, source: 'user'

  has_many :rooms
end
