class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :epithets
  
  validates_presence_of :title, :article
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :reserved_words => ["articles"]
  
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
