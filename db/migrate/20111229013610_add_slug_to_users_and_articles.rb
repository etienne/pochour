class AddSlugToUsersAndArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string
    add_index :articles, :slug, unique: true
    
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
