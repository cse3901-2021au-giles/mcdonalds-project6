class CreateGroupsProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_projects do |t|
      t.belongs_to :project
      t.belongs_to :group
      t.timestamps
    end
  end
end
