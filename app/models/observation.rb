class Observation < ApplicationRecord
  belongs_to :child
  belongs_to :activity
  belongs_to :learning_objective
end
