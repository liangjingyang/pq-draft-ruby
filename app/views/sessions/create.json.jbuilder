json.data do
  json.token @token.token
  json.partial! 'users/show', user: @user
end