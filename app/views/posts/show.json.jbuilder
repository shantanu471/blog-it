# frozen_string_literal: true

json.post do
  json.(@post, :id, :title, :description, :slug, :created_at, :updated_at)

  json.user do
    json.(@post.user, :id, :username)
  end

  json.categories @post.categories do |category|
    json.(category, :id, :category_name)
  end
end
