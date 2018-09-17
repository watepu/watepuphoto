class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    flash[:notice] = "お気に入りに登録しました"
    redirect_to pictures_url
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:notice] = "お気に入りから削除しました"
    redirect_to pictures_url
  end
end
