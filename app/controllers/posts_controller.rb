# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_post!, only: %i[show]

  def index
    @posts = PostQueryService.new(
      params.merge(
        organization_id: organization.id,
      )
  ).process!
  end

  def create
    organization.posts.create!(post_params.merge(user_id: current_user.id))
    render_notice(t("successfully_created", entity: "Post"))
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

    def current_user
      User.first
    end

    def organization
      Organization.first
    end
end
