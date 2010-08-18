module ApplicationHelper
  
  def publication_date(time)
    content_tag :time, l(time.to_date, :format => :long), :datetime => time.strftime("%Y-%m-%d") 
  end
  
end
