# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_post!, only: %i[show]

  def index
    posts = Post.all
    render status: :ok, json: { posts: }
  end

  def create
    Post.create!(post_params)
    render_notice(t("successfully_created"))
  end

  def show
    render_json({ post: @post })
  end

  private

    def load_post!
      @post = Post.find_by!(slug: params[:slug])
    end

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
