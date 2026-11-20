class CreateObjectiveGradeLevels < ActiveRecord::Migration[8.1]
  def change
    create_table :objective_grade_levels do |t|
      t.references :learning_objective, null: false, foreign_key: true
      t.references :grade_level, null: false, foreign_key: true
      t.string :expectation_type

      t.timestamps
    end
  end
end
