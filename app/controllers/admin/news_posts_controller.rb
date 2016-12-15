class Admin::NewsPostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/news_posts
  # GET /admin/news_posts.json
  def index
    @posts = NewsPost.all
  end

  # GET /admin/news_posts/1
  # GET /admin/news_posts/1.json
  def show
  end

  # GET /admin/news_posts/new
  def new
    @post = NewsPost.new
  end

  # GET /admin/news_posts/1/edit
  def edit
  end

  # POST /admin/news_posts
  # POST /admin/news_posts.json
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

  # PATCH/PUT /admin/news_posts/1
  # PATCH/PUT /admin/news_posts/1.json
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

  # DELETE /admin/news_posts/1
  # DELETE /admin/news_posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_posts_url, notice: 'News post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = NewsPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:news_post).permit(:title,:body,:published)
    end
end
