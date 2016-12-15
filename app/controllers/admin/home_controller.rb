class Admin::HomeController < AdminController

  def index
    @admin_actions = ["account","camp","employee","lab","program","faq"]
  end

end