# frozen_string_literal: true

class Post < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  MAX_DESCRIPTION_LENGTH = 10000

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

  before_create :set_slug

  private

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Post.exists?(slug: slug_candidate)

        itr += 1
      end
    end

    def slug_not_changed
      if will_save_change_to_slug? && self.persisted?
        errors.add(:slug, I18n.t("task.slug.immutable"))
      end
    end
end
