# frozen_string_literal: true

class AddForeignKeyToPost < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :posts, :organizations, column: :assigned_organization_id
  end
end
