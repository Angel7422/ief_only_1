class CreateLearningObjectives < ActiveRecord::Migration[8.1]
  def change
    create_table :learning_objectives do |t|
      t.references :domain, null: false, foreign_key: true
      t.references :curriculum_version, null: false, foreign_key: true
      t.references :parent, foreign_key: { to_table: :learning_objectives }
      t.string :code
      t.string :title
      t.text :description
      t.string :objective_type
      t.integer :position

      t.timestamps
    end
  end
end
