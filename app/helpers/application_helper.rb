module ApplicationHelper
  
  def date_tag(time)
    content_tag :time, l(time.to_date, :format => :long), :datetime => time.strftime("%Y-%m-%d") 
  end

  def date_and_time_tag(time)
    content_tag :time, l(time, :format => :long), :datetime => time.strftime("%Y-%m-%dT%H:%M") 
  end
  
end
