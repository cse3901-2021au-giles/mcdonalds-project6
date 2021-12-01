class Group < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :projects

    validates :groupname, presence: true, length: { maximum: 50 },
    uniqueness: {message: 'Group name already taken'}
end
