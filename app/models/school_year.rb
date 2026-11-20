class SchoolYear < ApplicationRecord
  has_many :child_school_years
  has_many :children, through: :child_school_years

  has_many :learning_progresses
  
  has_many :reports
end
