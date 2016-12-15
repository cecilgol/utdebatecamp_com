class StaticPagesController < ApplicationController
  before_action :set_camps

  def index
  end

  def about
  end

  def apply_to_work
  end

  def create_account
  end

  private
  def set_camps
    @camps = Camp.all
  end
end
