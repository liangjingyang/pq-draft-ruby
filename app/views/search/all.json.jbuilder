json.data do
  json.boxes @boxes do |box|
    json.partial! 'boxes/show', box: box, user: current_user
  end
  json.posts @posts do |post|
    json.partial! 'posts/show', post: post
  end
end