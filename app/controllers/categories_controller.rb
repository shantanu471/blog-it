# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render status: :ok, json: { categories: }
  end

  def create
    Category.create!(category_params)
    render_notice(t("successfully_created_category"))
  end

  private

    def category_params
      params.require(:category).permit(:category_name)
    end
end
