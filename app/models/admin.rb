class Admin < ApplicationRecord
    has_many :groups
    has_and_belongs_to_many :users

    before_save { a_email.downcase! }
    validates :a_name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[a-z]+.[1-9]\d*@osu.edu/i
    validates :a_email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: true

    validates :a_password, presence: true, length: { minimum: 8 }
end
