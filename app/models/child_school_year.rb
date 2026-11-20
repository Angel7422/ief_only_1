class ChildSchoolYear < ApplicationRecord
  belongs_to :child
  belongs_to :school_year
  belongs_to :grade_level
end
