class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }

  # def self.search(search)
  #   if search
  #     Profile.where('content like?', "%#{search}%")
  #   else
  #     Profile.all
  #   end
  # end
end
