class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :epithets
  
  validates_presence_of :title, :body
  
  mount_uploader :image, ImageUploader
  
  extend FriendlyId
  friendly_id :title
  
  def normalize_friendly_id(string)
    super.blank? ? "sans-titre" : super
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
