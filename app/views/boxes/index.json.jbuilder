json.partial! 'shared/pagination', relation: @boxes

json.boxes @boxes do |box|
  json.partial! 'show', box: box
end