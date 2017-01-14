class Admin::NewsPostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]



  def index
    @posts = NewsPost.all
  end



  def show
  end


  def new
    @post = NewsPost.new
  end


  def edit
  end



  def create
    @post = NewsPost.new(post_params)
    @post.account = current_user.account
    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_news_posts_url, notice: 'News post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_news_posts_url, notice: 'News post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_posts_url, notice: 'News post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = NewsPost.find(params[:id])
    end


    def post_params
      params.require(:news_post).permit(:title,:body,:published)
    end
end
