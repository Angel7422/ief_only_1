class LearningProgress < ApplicationRecord
  belongs_to :child
  belongs_to :learning_objective
  belongs_to :school_year
end
