class StaticPagesController < ApplicationController
  def index
  	@articles = Article.order("created_at DESC").page params[:page]
  end

  def contacts
  	add_breadcrumb "Контакты", "/contacts.html"
  end
end
