require "nokogiri"

namespace :import do
  def hashes_from_xml(file_path, table)
    hashes = []
    Nokogiri::XML(File.open(file_path)).css("pochour #{table}").each do |rows|
      hash = {}
      rows.children.each do |column|
        hash[column.name.to_sym] = column.content unless column.text?
      end
      hashes << hash
    end
    hashes
  end
  
  desc "Import users from legacy database"
  task :users => :environment do
    puts "Deleting previous users..."
    User.delete_all
    users = hashes_from_xml("db/legacy/users.xml", "users")
    users.each do |user|
      puts "Attempting to import the following user:"
      puts user.to_yaml
      u = User.new(user)
      u.id = user[:id]
      u.bio = user[:bio_fr]
      u.admin = true if user[:status] == "admin"
      u.created_at = Date.parse(user[:registered])
      u.save!
      puts "Successfully imported user '#{user[:name]}'"
      puts "----------------------------------------------------------"
    end
  end

  desc "Import articles from legacy database"
  task :articles => :environment do
    puts "Deleting previous articles..."
    Article.delete_all
    articles = hashes_from_xml("db/legacy/articles.xml", "articles")
    articles.each do |article|
      puts "Attempting to import article '#{article[:title]}'..."
      a = Article.new
      a.id = article[:id]
      a.title = article[:title].blank? ? "(Sans titre)" : article[:title]
      a.title << " : " << article[:subtitle] unless article[:subtitle].blank?
      a.user_id = article[:author]
      a.article = article[:text].blank? ? " " : article[:text]
      a.created_at = Date.parse(article[:date])
      a.updated_at = Date.parse(article[:datemodified]) unless (article[:datemodified] == "0000-00-00 00:00:00" || article[:datemodified].blank?)
      a.save!
      puts "Great success."
      puts "----------------------------------------------------------"
    end
  end
  
  desc "Import all data from legacy database"
  task :all => [:users, :articles]
end
