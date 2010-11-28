class RemoveArticleIdFromEpithetVotes < ActiveRecord::Migration
  def self.up
    remove_column :epithet_votes, :article_id
  end

  def self.down
    add_column :epithet_votes, :article_id
  end
end
