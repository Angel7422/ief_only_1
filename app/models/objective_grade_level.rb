class ObjectiveGradeLevel < ApplicationRecord
  belongs_to :learning_objective
  belongs_to :grade_level
end
