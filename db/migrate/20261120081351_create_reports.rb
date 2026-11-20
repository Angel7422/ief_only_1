class CreateReports < ActiveRecord::Migration[8.1]
  def change
    create_table :reports do |t|
      t.references :child, null: false, foreign_key: true
      t.references :school_year, null: false, foreign_key: true
      t.string :title
      t.date :period_start
      t.date :period_end
      t.text :summary
      t.json :data_snapshot, default: {}

      t.timestamps
    end
  end
end
