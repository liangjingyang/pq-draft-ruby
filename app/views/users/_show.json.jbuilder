json.id user.id
json.name user.name
json.image user.image
json.box do
  json.partial! 'boxes/show', box: user.box
end