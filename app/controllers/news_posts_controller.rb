class NewsPostsController < ApplicationController
  def index
    @posts = NewsPost.where("published = true")
  end
end
