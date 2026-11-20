class Domain < ApplicationRecord
  belongs_to :subject
  has_many :learning_objectives
end
