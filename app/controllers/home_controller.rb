# encoding: UTF-8

class HomeController < ApplicationController
  def index
    @articles = Article.where(:draft => false).page(params[:page]).order("created_at DESC")
    @slogan = [
      "Des affaires.",
      "C’était vraiment long.",
      "Sans slogan depuis 1903.",
      "On s’y croirait.",
      "On travaille chaud.",
      "Entrez voir nos spéciaux.",
      "Là où la qualité n’est pas un obstacle.",
      "Malade.",
      "Fais-le vous-même."
    ].sample
  end
end
