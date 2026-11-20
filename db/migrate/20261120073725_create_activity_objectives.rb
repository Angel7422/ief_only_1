class CreateActivityObjectives < ActiveRecord::Migration[8.1]
  def change
    create_table :activity_objectives do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :learning_objective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
