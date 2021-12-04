class Project < ApplicationRecord
    has_many :project_groups
    has_many :groups, through: :project_groups
end
