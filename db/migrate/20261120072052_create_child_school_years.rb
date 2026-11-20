class CreateChildSchoolYears < ActiveRecord::Migration[8.1]
  def change
    create_table :child_school_years do |t|
      t.references :child, null: false, foreign_key: true
      t.references :school_year, null: false, foreign_key: true
      t.references :grade_level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
