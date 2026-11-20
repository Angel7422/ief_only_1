class CreateLearningProgresses < ActiveRecord::Migration[8.1]
  def change
    create_table :learning_progresses do |t|
      t.references :child, null: false, foreign_key: true
      t.references :learning_objective, null: false, foreign_key: true
      t.references :school_year, null: false, foreign_key: true
      t.string :status
      t.date :observed_on
      t.text :comment

      t.timestamps
    end
  end
end
