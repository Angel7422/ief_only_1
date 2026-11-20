class CreateActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :activities do |t|
      t.references :child, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :activity_date
      t.integer :duration
      t.string :activity_type

      t.timestamps
    end
  end
end
