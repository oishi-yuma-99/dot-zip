class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  def self.search_for(content, method)
    Post.where('body LIKE ?', '%' + content + '%')
  end
end
