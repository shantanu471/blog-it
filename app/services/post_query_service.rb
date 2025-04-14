# frozen_string_literal: true

class PostQueryService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def process!
    query_posts
  end

  private

    def query_posts
      posts = base_query

      if category_filter_present?
        posts = apply_category_filter(posts)
      end

      posts.distinct
    end

    def base_query
      Post.includes(:categories, :user)
        .where(organization_id: params[:organization_id])
    end

    def category_filter_present?
      params[:category_id].present? ||
      params[:category_name].present? ||
      params[:category_names].present?
    end

    def apply_category_filter(posts)
      if params[:category_id].present?
        filter_by_category_id(posts)
      elsif params[:category_name].present?
        filter_by_category_name(posts)
      elsif params[:category_names].present?
        filter_by_category_names(posts)
      end
    end

    def filter_by_category_id(posts)
      posts.joins(:categories).where(categories: { id: params[:category_id] })
    end

    def filter_by_category_name(posts)
      posts.joins(:categories).where(
        "LOWER(categories.name) LIKE LOWER(?)",
        "%#{params[:category_name]}%"
      )
    end

    def filter_by_category_names(posts)
      posts.joins(:categories).where(
        "LOWER(categories.name) IN (?)",
        params[:category_names].map(&:downcase)
      )
    end
end
