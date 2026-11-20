class Report < ApplicationRecord
  belongs_to :child
  belongs_to :school_year
end
