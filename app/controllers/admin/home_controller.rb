class Admin::HomeController < AdminController

  def index
    @admin_actions = ["account","camp","employee","lab","program"]
  end

end