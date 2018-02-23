json.partial! 'shared/pagination', relation: @box_followers

json.data @box_followers do |box_follower|
  json.partial! 'show', box_follower: box_follower
end