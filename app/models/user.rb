class User < ApplicationRecord
    has_many :groupings
    has_many :groups, through: :groupings
end
