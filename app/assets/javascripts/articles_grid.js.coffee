$(document).ready ->
  # Make specified <li>’s clickable. Use the first <a> as link target.
  $('ul.clickable_items li').each (item) ->
    $(this).click ->
      location.href = $(this).find('a').first().attr('href')
