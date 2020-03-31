class FeedsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: "写真を投稿しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path, notice: "投稿を削除しました。"
  end

  private

  def feed_params
    params.require(:feed).permit(:image, :description)
  end

  def set_id
    @feed = Feed.find(params[:id])
  end
end
