# encoding: utf-8

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
  
  def writedown(string)
    file = Tempfile.new('pochour-import-legacy')
    file << string
    file.flush
    `php lib/legacy/writedown.php #{file.path}`
  end
  
  desc "Import users from legacy database"
  task :users => :environment do
    puts "Deleting previous users..."
    User.delete_all
    users = hashes_from_xml("db/legacy/users.xml", "users")
    users.each do |user|
      puts "Attempting to import user: #{user[:name]}"
      u = User.new(user)
      u.id = user[:id]
      u.bio = user[:bio_fr]
      u.admin = true if user[:status] == "admin"
      u.created_at = Time.parse(user[:registered])
      u.save!
      puts "Great success."
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
      a.title << " : " << article[:subtitle] unless article[:subtitle].blank?
      a.user_id = article[:author]
      a.draft = article[:draft]
      if article[:text].blank?
        a.body = " "
      else
        a.body = writedown(article[:text])
      end
      a.abstract = writedown(article[:abstract]) unless article[:abstract].blank?
      a.created_at = DateTime.parse(article[:date])
      a.updated_at = DateTime.parse(article[:datemodified]) unless (article[:datemodified] == "0000-00-00 00:00:00" || article[:datemodified].blank?)
      a.save!
      puts "Great success."
      puts "----------------------------------------------------------"
    end
  end

  desc "Import comments from legacy database"
  task :comments => :environment do
    puts "Deleting previous comments..."
    Comment.delete_all
    puts "Importing comments..."
    comments = hashes_from_xml("db/legacy/commentations.xml", "commentations")
    comments.each do |comment|
      break if comment[:article].blank?
      c = Comment.new
      c.id = comment[:id]
      c.user_id = comment[:authorID] unless comment[:authorID].blank?
      c.author = comment[:author] unless comment[:author].blank?
      if comment[:text].blank?
        c.comment = " "
      else
        c.comment = writedown(comment[:text])
      end
      c.article_id = comment[:article]
      c.created_at = DateTime.parse(comment[:date])
      c.save!
      puts "Imported comment ID " + c.id.to_s
    end
  end
  
  desc "Import all data from legacy database"
  task :all => [:users, :articles, :comments]
end
