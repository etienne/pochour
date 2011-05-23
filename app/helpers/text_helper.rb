# encoding: UTF-8

require "rubygems"
require "nokogiri"

module TextHelper
  def truncate_html(text, ideal_length)
    n = Nokogiri::HTML::DocumentFragment
    doc = n.parse text
    best_fragment = ""
    best_distance = nil
    algorithms = []
    algorithms << doc.css('p').first                                     # First paragraph
    algorithms << n.parse(text.split(%r|<br\s?/?>|)[0..2].join("<br>"))  # First 3 line breaks
    algorithms << n.parse(text.split(/\.[\s<]/).first + ".")             # First sentence
    algorithms << doc.truncate((ideal_length * 1.3).round)               # Truncated string
    algorithms << doc                                                    # Original full text
    algorithms.each do |fragment|
      if fragment.respond_to? "inner_text"
        distance = (fragment.inner_text.length - ideal_length).abs
        if best_distance.nil? || distance < best_distance
          best_distance = distance
          best_fragment = fragment
        end
      end
    end
    
    if best_fragment.inner_text.last =~ /[\.…]/ 
      best_fragment.to_s
    elsif best_fragment.children.last.is_a? Nokogiri::XML::Element
      best_fragment.children.last << "..."
      best_fragment.to_s
    else
      best_fragment.to_s
    end
  end
end

module NokogiriTruncator
  module NodeWithChildren
    def truncate(max_length)
      return self if inner_text.length <= max_length
      truncated_node = self.dup
      truncated_node.children.remove

      self.children.each do |node|
        remaining_length = max_length - truncated_node.inner_text.length
        break if remaining_length <= 0
        truncated_node.add_child node.truncate(remaining_length)
      end
      truncated_node
    end
  end

  module TextNode
    def truncate(max_length)
      Nokogiri::XML::Text.new(content[0..(max_length - 1)].rstrip, parent)
    end
  end

end

Nokogiri::HTML::DocumentFragment.send(:include, NokogiriTruncator::NodeWithChildren)
Nokogiri::XML::Element.send(:include, NokogiriTruncator::NodeWithChildren)
Nokogiri::XML::Text.send(:include, NokogiriTruncator::TextNode)


# pour idéal = 100
#   premier élément
#   avant le troisième br
#   première phrase
#   coupe à 130 caractères