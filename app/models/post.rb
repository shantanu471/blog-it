# frozen_string_literal: true

class Post < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  MAX_DESCRIPTION_LENGTH = 10000

  has_and_belongs_to_many :categories

  belongs_to :organization

  belongs_to :user

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH }
  validates :description,
    presence: true,
    length: { maximum: MAX_DESCRIPTION_LENGTH }
  validates :upvotes,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :downvotes,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_inclusion_of :is_bloggable,
    in: [true, false]
  validates :slug,
    uniqueness: true

  validate :slug_not_changed

  validate :categories_belong_to_same_organization

  before_create :set_slug

  private

    def set_slug
      title_slug = title.parameterize
      regex_pattern = "slug #{Constants::DB_REGEX_OPERATOR} ?"
      latest_task_slug = Post.where(
        regex_pattern,
        "^#{title_slug}$|^#{title_slug}-[0-9]+$"
      ).order("LENGTH(slug) DESC", slug: :desc).first&.slug
      slug_count = 0
      if latest_task_slug.present?
        slug_count = latest_task_slug.split("-").last.to_i
        only_one_slug_exists = slug_count == 0
        slug_count = 1 if only_one_slug_exists
      end
      slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
      self.slug = slug_candidate
    end

    def slug_not_changed
      if will_save_change_to_slug? && self.persisted?
        errors.add(:slug, I18n.t("task.slug.immutable"))
      end
    end

    def categories_belong_to_same_organization
      if categories.any? { |category| category.organization_id != organization_id }
        errors.add(:categories, "must belong to the same organization as the post")
      end
    end
end
