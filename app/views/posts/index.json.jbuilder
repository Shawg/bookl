json.array!(@posts) do |post|
  json.extract! post, :id, :price, :description, :user_account_id, :book_id
  json.url post_url(post, format: :json)
end
