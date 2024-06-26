class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 検索機能
  def self.search_for(content, method)
    Post.where('body LIKE ?', '%' + content + '%')
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
