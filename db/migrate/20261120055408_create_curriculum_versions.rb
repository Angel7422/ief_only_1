class CreateCurriculumVersions < ActiveRecord::Migration[8.1]
  def change
    create_table :curriculum_versions do |t|
      t.string :name
      t.string :official_reference
      t.string :source_url
      t.date :published_at
      t.date :effective_from
      t.date :effective_until

      t.timestamps
    end
  end
end
