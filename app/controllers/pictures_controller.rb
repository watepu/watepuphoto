class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    
    if @picture.save
      SubmitMailer.submit_mail(@picture).deliver
      flash[:notice] = "画像を投稿しました"
      redirect_to pictures_path
    else
      flash[:danger] = "画像の投稿に失敗しました"
      render 'new'
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "編集しました"
      redirect_to pictures_path
    else
      flash[:danger] = "編集に失敗しました"
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "削除しました"
    redirect_to pictures_path
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:title,:content,:image,:image_cache)
  end
end
