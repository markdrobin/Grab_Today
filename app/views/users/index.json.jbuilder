json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :login_status, :username, :password, :email
  json.url user_url(user, format: :json)
end
