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
  
  def writedown_filter(method, string)
    file = Tempfile.new('pochour-import-legacy')
    file << string
    file.flush
    `php lib/legacy/#{method}.php #{file.path}`
  end

  def text2xhtml(string)
    writedown_filter 'text2xhtml', string
  end
  
  def format_text(string)
    writedown_filter 'format_text', string
  end
  
  def import_results(model_name, invalid_records, params)
    puts ""
    if invalid_records.blank?
      puts "All #{model_name} were successfully imported."
    else
      puts "The following #{model_name} could not be imported:"
      puts "------------------------------------------"
      invalid_records.each do |record|
        params.each do |param|
          puts "#{param.to_s}: #{record.send(param)}"
        end
        puts "------------------------------------------"
      end
    end
  end
  
  desc "Import users from legacy database"
  task :users => :environment do
    puts "Deleting previous users..."
    User.delete_all
    puts "Importing users..."
    users = hashes_from_xml("db/legacy/users.xml", "users")
    invalid_users = []
    users.each do |user|
      u = User.new(user)
      u.id = user[:id]
      u.bio = user[:bio_fr]
      u.admin = true if user[:status] == "admin"
      u.created_at = Time.parse(user[:registered])
      if u.valid?
        print '.'
        u.save!
      else
        invalid_users << u
        print 'E'
      end
    end
    import_results("users", invalid_users, [:id, :name])
  end

  desc "Import articles from legacy database"
  task :articles => :environment do
    puts "Deleting previous articles..."
    Article.delete_all
    puts "Importing articles..."
    articles = hashes_from_xml("db/legacy/articles.xml", "articles")
    invalid_articles = []
    articles.each do |article|
      a = Article.new
      a.id = article[:id]
      a.title = article[:title].blank? ? "(Sans titre)" : format_text(article[:title])
      a.title << " : " << format_text(article[:subtitle]) unless article[:subtitle].blank?
      a.user_id = article[:author]
      a.draft = article[:draft]
      if article[:text].blank?
        a.body = " "
      else
        a.body = text2xhtml(article[:text])
      end
      a.abstract = text2xhtml(article[:abstract]) unless article[:abstract].blank?
      a.created_at = DateTime.parse(article[:date])
      a.updated_at = DateTime.parse(article[:datemodified]) unless (article[:datemodified] == "0000-00-00 00:00:00" || article[:datemodified].blank?)
      a.updated_at ||= a.created_at
      if a.valid?
        print '.'
        a.save!
      else
        print 'E'
        invalid_articles << a
      end
    end
    import_results("articles", invalid_articles, [:id, :title, :user_id, :draft])
  end

  desc "Import comments from legacy database"
  task :comments => :environment do
    puts "Deleting previous comments..."
    Comment.delete_all
    puts "Importing comments..."
    comments = hashes_from_xml("db/legacy/commentations.xml", "commentations")
    invalid_comments = []
    comments.each do |comment|
      break if comment[:article].blank?
      c = Comment.new
      c.id = comment[:id]
      c.user_id = comment[:authorID] unless comment[:authorID].blank?
      c.author = comment[:author] unless comment[:author].blank?
      if comment[:text].blank?
        c.comment = " "
      else
        c.comment = text2xhtml(comment[:text])
      end
      c.article_id = comment[:article]
      c.created_at = DateTime.parse(comment[:date])
      if c.valid?
        print '.'
        c.save!
      else
        print 'E'
        invalid_comments << c
      end
      import_results("comments", invalid_comments, [:id, :user_id])
    end
  end
  
  desc "Import all data from legacy database"
  task :all => [:users, :articles, :comments]
end
