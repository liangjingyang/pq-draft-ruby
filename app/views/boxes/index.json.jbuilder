json.partial! 'shared/pagination', relation: @boxes

json.data @boxes do |box|
  json.partial! 'show', box: box
end