class CreateEvaluation < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :evaluee
      t.text :context
      t.integer :rating

      t.timestamps
    end
  end
end
