class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all.page(params[:page]).per(10)
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end
end
