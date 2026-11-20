class GradeLevel < ApplicationRecord
  belongs_to :cycle

  has_many :objective_grade_levels
  has_many :learning_objectives, through: :objective_grade_levels

  has_many :child_school_years
  has_many :children, through: :child_school_years
end
