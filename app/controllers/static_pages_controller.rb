class StaticPagesController < ApplicationController
  before_action :set_camps

  def index
 
  end

  def about
  end

  def apply_to_work
  end

  def create_account
    if current_user.account != nil
      redirect_to root_path
    end
  end

  def letsencrypt
    render text: 'J2vwy8GxBVdTpiCMopCHR3zXOYYoKTYXdOe8T7M1T8E.d5pK7IaTpTaVqCVAJdyrM8kShbQ3SUeBDZo06JRzB1U'
  end
  private
  def set_camps
    @camps = Camp.order(id: :asc)
  end
end
