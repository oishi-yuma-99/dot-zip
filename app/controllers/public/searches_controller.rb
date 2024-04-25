class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]&.gsub('@', '')
    @method = params[:method]
    @content_type = params[:content_type]
    
    # 検索結果を日本語化
    content_type_names = {
      'name' => 'ニックネーム',
      'account_name' => 'アカウント名',
      'tag' => 'タグ'
    }
    @content_type_name = content_type_names[@content_type]
    
    if @model == "user"
      @records = User.search_for(@content, @content_type, @method)
    else
      @records = Post.search_for(@content, @method)
    end
  end
end
