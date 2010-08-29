class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates_presence_of :title, :article
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :reserved_words => ["articles"]
end
