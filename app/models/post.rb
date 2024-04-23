class Post < ApplicationRecord
  belongs_to :user
  
  def self.search_for(content, method)
    Post.where('body LIKE ?', '%' + content + '%')
  end
end
