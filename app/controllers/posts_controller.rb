# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_post!, only: %i[show]

  def index
    posts = Post.includes(:categories, :user)
    if params[:category_id].present?
      posts = posts.joins(:categories).where(categories: { id: params[:category_id] })
    elsif params[:category_name].present?
      posts = posts.joins(:categories).where(
        "LOWER(categories.category_name) LIKE LOWER(?)",
        "%#{params[:category_name]}%")
    elsif params[:category_names].present?
      posts = posts.joins(:categories).where(
        "LOWER(categories.category_name) IN (?)",
        params[:category_names].map(&:downcase)
      )
    end

    @post_ids = posts.distinct.pluck(:id)
    @posts = Post.includes(:categories, :user).where(id: @post_ids)
  end

  def create
    Post.create!(post_params)
    render_notice(t("successfully_created"))
  end

  def show
    render
  end

  private

    def load_post!
      @post = Post.find_by!(slug: params[:slug])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :description,
        :user_id,
        :organization_id,
        category_ids: []
           )
    end
end
