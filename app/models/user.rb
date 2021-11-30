class User < ApplicationRecord
    has_and_belongs_to_many :admins
    has_and_belongs_to_many :groups
    has_many :evaluations
    has_many :projects, through: :evaluations

    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[a-z]+\.[1-9]\d*@osu\.edu/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: true

    validates :password, presence: true, length: { minimum: 8 }

   
end