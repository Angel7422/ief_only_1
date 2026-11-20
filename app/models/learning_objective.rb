class LearningObjective < ApplicationRecord
  belongs_to :domain
  belongs_to :curriculum_version

  belongs_to :parent, class_name: "LearningObjective", optional: true
  
  has_many :children, class_name: "LearningObjective", foreign_key: "parent_id"
  
  has_many :objective_grade_levels
  has_many :grade_levels, through: :objective_grade_levels
 
  has_many :activity_objectives
  has_many :activities, through: :activity_objectives

  has_many :learning_progresses
  has_many :observations

  validates :title, presence: true
end
