json.extract! post, :id, :user_id, :topic, :post_text, :attachment, :visibility, :expiration_date, :created_at, :updated_at
json.url post_url(post, format: :json)
