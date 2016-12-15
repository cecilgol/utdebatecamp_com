class Admin::FaqsController < AdminController
  before_action :authenticate_user!
  before_action :set_faq, only: [:edit,:update,:destroy]

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new  
  end

  def edit
  end

  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html {redirect_to admin_faqs_path, notice: "you created a frequently asked question"}
      else
        format.html {render :new}
      end
    end

  end

  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html {redirect_to admin_faqs_path, notice: "you updated a frequently asked question"}
      else
        format.html {render :new}
      end
    end
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html {redirect_to admin_faqs_path, warn: "you destroyed that frequently asked question"}
    end
  end
  private

  def set_faq
    @faq = Faq.find(params[:id])
  end
  
  def faq_params
    params.require(:faq).permit(:question,:answer)
  end

end