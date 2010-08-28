module ApplicationHelper
  
  def publication_date(time)
    content_tag :time, l(time.to_date, :format => :long), :datetime => time.strftime("%Y-%m-%d") 
  end

  def publication_date_and_time(time)
    content_tag :time, l(time, :format => :long), :datetime => time.strftime("%Y-%m-%dT%H:%M") 
  end
  
end
