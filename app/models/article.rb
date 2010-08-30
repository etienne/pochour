class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :epithet_votes
  has_many :epithets, :through => :epithet_votes
  
  validates_presence_of :title, :article
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :reserved_words => ["articles"]
end
