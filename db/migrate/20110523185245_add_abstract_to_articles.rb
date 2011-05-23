class AddAbstractToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :abstract, :string
  end
end
