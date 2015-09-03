# encoding: UTF-8

class StaticPagesController < ApplicationController
  def index
  	@articles = Article.where("view = true").order("created_at DESC").page params[:page]

    set_meta_tags :title => "",
      :description => "Портал о звукотехнике, проектировании и создании аналоговых усилителей и УМЗЧ на контроллерах",
      :keywords => "УМЗЧ, звукотехника, схемы и платы, усилители мощности, усилитель своими руками, аналоговые усилители, усилители звука, усилитель на микросхеме,
      микроконтролеры для усилителей"
  end

  def contacts
  	add_breadcrumb "Контакты", "/contacts.html"
  end
end
