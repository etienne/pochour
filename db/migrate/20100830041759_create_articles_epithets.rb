class CreateArticlesEpithets < ActiveRecord::Migration
  def self.up
    create_table :articles_epithets, :id => false do |t|
      t.references :article, :epithet
    end
  end

  def self.down
    drop_table :articles_epithets
  end
end
