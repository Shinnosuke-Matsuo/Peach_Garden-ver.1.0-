class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
             # format: { with: VALID_EMAIL_REGEX },
             # uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_one :profile, dependent: :destroy
  has_many :micropost, dependent: :destroy
  has_many :matchings, dependent: :destroy
  has_many :matching_microposts, through: :matchings, source: 'micropost'

  #DMの関連付け
  has_many :from_messages, class_name: "Message",
            foreign_key: "from_id", dependent: :destroy
  has_many :to_messages, class_name: "Message",
            foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, through: :from_messages, source: :from
  has_many :received_messages, through: :to_messages, source: :to

  def send_message(other_user, room_id, content)
    from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Profile.where("user_id = ?", id)
  end

  # def self.search(search)
  #   if search
  #     where(['name LIKE ?', "%#{search}%"])
  #   else
  #     all
  #   end
  # end
end
