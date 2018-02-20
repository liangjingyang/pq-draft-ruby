json.partial! 'shared/pagination', relation: @posts

json.data @posts do |post|
  json.partial! 'posts/show', post: post
end