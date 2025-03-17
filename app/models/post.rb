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
        
end