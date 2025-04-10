# frozen_string_literal: true

class Category < ApplicationRecord
  MAX_NAME_LENGTH = 100

  has_and_belongs_to_many :posts

  belongs_to :organization

  validates :category_name, presence: true, uniqueness: { scope: :organization_id },
    length: { maximum: MAX_NAME_LENGTH }
end
