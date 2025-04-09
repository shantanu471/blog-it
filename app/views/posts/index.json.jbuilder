# frozen_string_literal: true

json.posts @posts do |post|
  json.extract! post, :id, :title, :description, :slug, :created_at, :updated_at

  json.categories post.categories do |category|
    json.extract! category, :id, :category_name
  end

  json.user do
    json.extract! post.user, :id, :username, :email
  end
end
