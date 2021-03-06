class FeedsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = current_user.feeds.build(feed_params)
    if params[:back]
      render :new
    else
      if @feed.save
        redirect_to feeds_path, notice: "投稿しました。"
      else
        render :new
      end
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

  def confirm
    @feed = current_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end

  private

  def feed_params
    params.require(:feed).permit(:image, :description, :image_cache)
  end

  def set_id
    @feed = Feed.find(params[:id])
  end
end
