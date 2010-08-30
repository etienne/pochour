class CreateEpithetVotes < ActiveRecord::Migration
  def self.up
    create_table :epithet_votes do |t|
      t.references :user
      t.references :article
      t.references :epithet
      t.boolean :vote

      t.timestamps
    end
  end

  def self.down
    drop_table :epithet_votes
  end
end
