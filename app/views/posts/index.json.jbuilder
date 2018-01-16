json.partial! 'shared/pagination', relation: @posts

json.posts @posts do |post|
  json.partial! 'show', post: post
end