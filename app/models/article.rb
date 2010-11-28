class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :epithets
  
  validates_presence_of :title, :article
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :reserved_words => ["articles"]
end
