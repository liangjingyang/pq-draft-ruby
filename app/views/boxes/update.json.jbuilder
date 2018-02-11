json.data do
  json.partial! 'show', box: @box, user: current_user
end