class StaticPagesController < ApplicationController
  before_action :set_camps, only: [:index,:apply_to_work]

  def index
  end

  def about
  end

  def apply_to_work
  end

  private
  def set_camps
    @camps = Camp.all
  end
end
