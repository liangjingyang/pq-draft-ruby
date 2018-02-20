json.partial! 'shared/pagination', relation: @boxes

json.data @boxes do |box|
  json.partial! 'boxes/show', box: box, user: current_user
end