json.array!(@articles) do |article|
  json.extract! article, :id, :name, :text, :image, :category_id, :user_id
  json.url article_url(article, format: :json)
end
