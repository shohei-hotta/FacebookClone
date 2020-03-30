class FeedsController < ApplicationController
  def index
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

  private

  def feed_params
    params.require(:feed).permit(:image, :description)
  end
end
