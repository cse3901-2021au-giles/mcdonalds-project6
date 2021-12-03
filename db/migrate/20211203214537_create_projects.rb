class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :projectname
      t.string :projecttype
      t.string :date

      t.timestamps
    end
  end
end
