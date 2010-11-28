class Epithet < ActiveRecord::Base
  has_many :epithet_votes
  has_many :users, :through => :epithet_votes
  has_and_belongs_to_many :articles
  
  validates_uniqueness_of :name, :case_sensitive => false
end
