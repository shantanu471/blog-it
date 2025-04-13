# frozen_string_literal: true

class RenameColumnsInOrganizationAndCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :categories, :category_name, :name
    rename_column :organizations, :organization_name, :name
  end
end
