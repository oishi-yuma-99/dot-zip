class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
         
  has_one_attached :album_jacket_1
  has_one_attached :album_jacket_2
  has_one_attached :favorite_picture_1
  has_one_attached :favorite_picture_2
  has_one_attached :favorite_picture_3
  has_one_attached :favorite_item_1
  has_one_attached :favorite_item_2
  has_one_attached :favorite_item_3
  has_one_attached :favorite_item_4
  has_one_attached :favorite_item_5
  has_one_attached :favorite_item_6
  has_one_attached :favorite_item_7
  has_one_attached :favorite_item_8

  before_create :set_account_name

  VALID_ACCOUNT_NAME_REGEX = /\A[a-zA-Z0-9]+\z/  # 半角英数字のみ受け付ける正規表現
  validates :account_name, uniqueness: true,
                           length: { minimum:3, maximum: 50 },
                           format: { with: VALID_ACCOUNT_NAME_REGEX }, 
                           on: :update # updateアクションにのみバリデーションを適用する
  
  def to_param
    account_name
  end
  
  GUEST_MEMBER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def guest_user?
    email == GUEST_MEMBER_EMAIL
  end
  
  def get_image(image)
    ActiveRecord::Base.connection_pool.with_connection do
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    end
    image
  end
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end
  
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  private
  def set_account_name # ランダムなアカウント名を返す
    while self.account_name.blank? || User.find_by(account_name: self.account_name).present? do
      self.account_name = SecureRandom.base36
    end
  end
end
