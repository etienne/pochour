class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :epithets
  
  validates_presence_of :title, :article
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true
  
  def normalize_friendly_id(string)
    normalized_string = string.normalize_for!(friendly_id_config).to_s
    if normalized_string.blank?
      "sans-titre"
    else
      normalized_string
    end
  end
  
  def display_title
    title.split(/\s?:\s?/, 2).first
  end
  
  def subtitle
    title.split(/\s?:\s?/, 2).second
  end
  
  def subtitle?
    !subtitle.nil?
  end
end
