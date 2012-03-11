# FIXME: Tell people that this is a manifest file, real code should go into discrete files
# FIXME: Tell people how Sprockets and CoffeeScript works
#
#= require jquery
#= require jquery_ujs
#= require_tree .

$(document).ready ->
  # Assign random color class to body
  colors = [
    "64, 174, 89"  # Green
    "58, 154, 197"  # Blue
    "56, 161, 162"  # Cyan
    "197, 58, 106"  # Fuschia
    "112, 68, 62"   # Brown
  ]
  color = colors[Math.floor(Math.random() * colors.length)]
  $.get '/private/colors.css', (css_template) ->
    css = css_template.replace(/COLOR/g, color)
    $('<style type="text/css" media="screen">' + css + '</style>').appendTo("head")
  
  # Make specified <li>’s clickable. Use the first <a> as link target.
  $('ul.clickable_items li').each (item) ->
    $(this).click ->
      location.href = $(this).find('a').first().attr('href')
