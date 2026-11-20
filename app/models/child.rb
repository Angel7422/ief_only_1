class Child < ApplicationRecord
  has_many :child_school_years, dependent: :destroy
  has_many :school_years, through: :child_school_years

  has_many :activities, dependent: :destroy

  has_many :learning_progresses, dependent: :destroy

  has_many :observations, dependent: :destroy

  has_many :reports, dependent: :destroy

  validates :full_name, :birth_date, :cycle, presence: true

end
