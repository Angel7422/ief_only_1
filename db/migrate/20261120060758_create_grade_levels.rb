class CreateGradeLevels < ActiveRecord::Migration[8.1]
  def change
    create_table :grade_levels do |t|
      t.references :cycle, null: false, foreign_key: true
      t.string :name
      t.string :code
      t.integer :position

      t.timestamps
    end
  end
end
