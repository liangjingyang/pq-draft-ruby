json.data do
  json.boxes @boxes do |box|
    json.partial! 'boxes/show', box: box, user: current_user
  end
  json.posts @posts do |post|
    json.partial! 'posts/show', post: post
  end
  json.box_followers @box_followers do |box_follower|
    json.partial! 'box_followers/show', box_follower: box_follower
  end
end