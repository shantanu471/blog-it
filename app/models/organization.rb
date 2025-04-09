# frozen_string_literal: true

class Organization < ApplicationRecord
  MAX_NAME_LENGTH = 100

  has_many :posts, dependent: :destroy

  has_many :users, dependent: :destroy

  validates :organization_name, presence: true, uniqueness: true, length: { maximum: MAX_NAME_LENGTH }
end
