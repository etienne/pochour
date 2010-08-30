class Epithet < ActiveRecord::Base
  has_many :epithet_votes
  has_many :articles, :through => :epithet_votes
end
