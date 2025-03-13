class Post < ApplicationRecord
    validate :title, presence: true
    validate :description, presence: true
    validate :upvotes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validate :downvotes, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end