json.partial! 'shared/pagination', relation: @posts
json.data do
  json.user do
    json.partial! 'users/show', user: @box.user
  end
  json.box do
    json.partial! 'boxes/show', box: @box
  end
  json.posts @posts do |post|
    json.partial! 'posts/show', post: post
  end
end