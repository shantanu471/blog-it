# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_post!, only: %i[show]

  def index
    @posts = PostQueryService.call(params)
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
