class User < ApplicationRecord
    has_many :groupings
    has_many :groups, through: :groupings
    has_many :evaluations
end
