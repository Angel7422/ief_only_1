class AddUniqueIndexes < ActiveRecord::Migration[8.1]
  def change
    add_index :objective_grade_levels,
              [:learning_objective_id, :grade_level_id],
              unique: true,
              name: "index_objective_grade_levels_unique"

    add_index :activity_objectives,
              [:activity_id, :learning_objective_id],
              unique: true,
              name: "index_activity_objectives_unique"

    add_index :child_school_years,
              [:child_id, :school_year_id],
              unique: true,
              name: "index_child_school_years_unique"
  end
end
