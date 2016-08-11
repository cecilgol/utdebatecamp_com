class StaticPagesController < ApplicationController
  def index
    @camps = Camp.all
  end

  def about
  end
end
