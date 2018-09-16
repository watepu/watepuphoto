class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    if @picture.save
      flash[:notice] = "画像を投稿しました"
      redirect_to pictures_path
    else
      flash[:danger] = "画像の投稿に失敗しました"
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title,:content,:image,:image_cache)
  end
end
