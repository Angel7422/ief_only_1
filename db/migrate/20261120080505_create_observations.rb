class CreateObservations < ActiveRecord::Migration[8.1]
  def change
    create_table :observations do |t|
      t.references :child, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.references :learning_objective, null: false, foreign_key: true
      t.date :observed_at
      t.text :content

      t.timestamps
    end
  end
end
