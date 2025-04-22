# frozen_string_literal: true

class CategoriesController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token

  def index
    categories = organization.categories
    render status: :ok, json: { categories: }
  end

  def create
    organization.categories.create!(category_params)
    render_notice(t("successfully_created", entity: "Category"))
  end

  private

    def organization
      current_user.organization
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
