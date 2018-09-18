class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user.id)
    else
      flash[:danger] = "ユーザー情報の更新が出来ませんでした"
      render 'edit'
    end
  end

  def about
    @favorite_pictures = current_user.favorite_pictures
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:icon,:icon_cache)
  end
end
