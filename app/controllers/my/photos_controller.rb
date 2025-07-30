class My::PhotosController < ApplicationController
  def index
    @photos = Current.user.photos.order(created_at: :desc)
  end

  def new
    @photo = Current.user.photos.build
  end

  def create
    @photo = Current.user.photos.build(photo_params)

    if @photo.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def photo_params
    params.expect(photo: %i[title image])
  end
end
