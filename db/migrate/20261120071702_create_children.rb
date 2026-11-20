class CreateChildren < ActiveRecord::Migration[8.1]
  def change
    create_table :children do |t|
      t.string :full_name
      t.date :birth_date
      t.text :notes

      t.timestamps
    end
  end
end
