class Activity < ApplicationRecord
  belongs_to :child

  has_many :activity_objectives
  has_many :learning_objectives, through: :activity_objectives

  has_many :observations

  validates :title, presence: true
end
