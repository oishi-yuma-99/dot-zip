class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  before_create :set_account_name

  VALID_ACCOUNT_NAME_REGEX = /\A[a-zA-Z0-9]+\z/  # 半角英数字のみ受け付ける正規表現
  validates :account_name, uniqueness: true,
                           length: { minimum:3, maximum: 50 },
                           format: { with: VALID_ACCOUNT_NAME_REGEX }, 
                           on: :update # updateアクションにのみバリデーションを適用する

  def to_param
    account_name
  end
  
  private
  def set_account_name　# ランダムなアカウント名を返す
    while self.account_name.blank? || User.find_by(account_name: self.account_name).present? do
      self.account_name = SecureRandom.base36
    end
  end
end
