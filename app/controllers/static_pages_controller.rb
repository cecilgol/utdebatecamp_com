class StaticPagesController < ApplicationController
  def index
    @camps = Camp.all
    @modal = { title: 'static_pages_controller#title', body: 'static_pages_controller#body' }
  end

  def about
  end
end
