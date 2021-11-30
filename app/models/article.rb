class Article < ApplicationRecord

    # extending gem rules
    extend FriendlyId
    # including visibility rules here, for status validation
    include Visible
    
    friendly_id :title, use: :slugged

    # MODELS ASSOCIATION
    # Each comment belongs to one article.
    # One article can have many comments.    
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 } 
end
