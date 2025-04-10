# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_organization

  def index
    categories = @organization.categories
    render status: :ok, json: { categories: }
  end

  def create
    @organization.categories.create!(category_params)
    render_notice(t("successfully_created_category"))
  end

  private

    def set_organization
      @organization = Organization.first
    end

    def category_params
      params.require(:category).permit(:category_name)
    end
end
