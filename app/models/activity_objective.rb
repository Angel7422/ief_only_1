class ActivityObjective < ApplicationRecord
  belongs_to :activity
  belongs_to :learning_objective
end
