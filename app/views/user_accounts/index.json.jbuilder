json.array!(@user_accounts) do |user_account|
  json.extract! user_account, :id, :email, :password, :isAdmin?
  json.url user_account_url(user_account, format: :json)
end
