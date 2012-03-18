$(document).ready ->
  # Handle user list form
  select = 'form#find_user #user_id'
  submit = 'form#find_user input[type=submit]'
  $(select).chosen().change( -> $(submit).click())
  $(submit).hide()