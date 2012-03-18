$(document).ready ->
  # Assign random color class to body
  colors = [
    "64, 174, 89"   # Green
    "58, 154, 197"  # Blue
    "56, 161, 162"  # Cyan
    "197, 58, 106"  # Fuschia
    "112, 68, 62"   # Brown
  ]
  color = colors[Math.floor(Math.random() * colors.length)]
  $.get '/private/colors.css', (css_template) ->
    css = css_template.replace(/COLOR/g, color)
    $('<style type="text/css" media="screen">' + css + '</style>').appendTo("head")
