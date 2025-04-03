# frozen_string_literal: true

class Organization < ApplicationRecord
  MAX_NAME_LENGTH = 100

  has_many :assigned_posts, foreign_key: :assigned_organization_id, class_name: "Post"

  validates :organization_name, presence: true, uniqueness: true, length: { maximum: MAX_NAME_LENGTH }
end
