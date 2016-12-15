json.extract! admin_news_post, :id, :created_at, :updated_at
json.url admin_news_post_url(admin_news_post, format: :json)