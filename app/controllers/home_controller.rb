# encoding: UTF-8

class HomeController < ApplicationController
  def index
    @articles = Article.where(:draft => false).order("created_at DESC").limit(30)
    @slogan = [
      "Des affaires.",
      "C’était vraiment long.",
      "Trop peu, trop tard.",
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
