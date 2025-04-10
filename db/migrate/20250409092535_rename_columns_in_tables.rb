# frozen_string_literal: true

class RenameColumnsInTables < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :assigned_organization_id, :organization_id
    rename_column :posts, :assigned_user_id, :user_id

    rename_column :users, :assigned_organization_id, :organization_id
  end
end
