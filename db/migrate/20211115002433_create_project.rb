class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :projectname
      t.string :projecttype
      t.date :deadline


      t.timestamps
    end
  end
end
