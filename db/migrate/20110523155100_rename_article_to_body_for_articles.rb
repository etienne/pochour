class RenameArticleToBodyForArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :article, :body
  end
end
