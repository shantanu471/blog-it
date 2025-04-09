# frozen_string_literal: true

class PostQueryService
  def self.call(params)
    posts = Post.includes(:categories, :user)

    if params[:category_id].present?
      posts = posts.joins(:categories).where(categories: { id: params[:category_id] })
    elsif params[:category_name].present?
      posts = posts.joins(:categories).where(
        "LOWER(categories.category_name) LIKE LOWER(?)",
        "%#{params[:category_name]}%"
      )
    elsif params[:category_names].present?
      posts = posts.joins(:categories).where(
        "LOWER(categories.category_name) IN (?)",
        params[:category_names].map(&:downcase)
      )
    end

    posts.distinct
  end
end
