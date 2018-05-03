class FavoritesController < ApplicationController
  def create
    current_user.favorites.create(instaclone_content_id: params[:instaclone_content_id])
    #redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
    redirect_to instaclone_contents_url
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    #redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
    redirect_to instaclone_contents_url
  end
end
