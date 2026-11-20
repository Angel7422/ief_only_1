# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_11_20_091838) do
  create_table "activities", force: :cascade do |t|
    t.integer "child_id", null: false
    t.string "title"
    t.text "description"
    t.date "activity_date"
    t.integer "duration"
    t.string "activity_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_activities_on_child_id"
  end

  create_table "activity_objectives", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "learning_objective_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id", "learning_objective_id"], name: "index_activity_objectives_unique", unique: true
    t.index ["activity_id"], name: "index_activity_objectives_on_activity_id"
    t.index ["learning_objective_id"], name: "index_activity_objectives_on_learning_objective_id"
  end

  create_table "child_school_years", force: :cascade do |t|
    t.integer "child_id", null: false
    t.integer "school_year_id", null: false
    t.integer "grade_level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id", "school_year_id"], name: "index_child_school_years_unique", unique: true
    t.index ["child_id"], name: "index_child_school_years_on_child_id"
    t.index ["grade_level_id"], name: "index_child_school_years_on_grade_level_id"
    t.index ["school_year_id"], name: "index_child_school_years_on_school_year_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "full_name"
    t.date "birth_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cycle"
  end

  create_table "curriculum_versions", force: :cascade do |t|
    t.string "name"
    t.string "official_reference"
    t.string "source_url"
    t.date "published_at"
    t.date "effective_from"
    t.date "effective_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cycles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.string "name"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_domains_on_subject_id"
  end

  create_table "grade_levels", force: :cascade do |t|
    t.integer "cycle_id", null: false
    t.string "name"
    t.string "code"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_id"], name: "index_grade_levels_on_cycle_id"
  end

  create_table "learning_objectives", force: :cascade do |t|
    t.integer "domain_id", null: false
    t.integer "curriculum_version_id", null: false
    t.integer "parent_id"
    t.string "code"
    t.string "title"
    t.text "description"
    t.string "objective_type"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_version_id"], name: "index_learning_objectives_on_curriculum_version_id"
    t.index ["domain_id"], name: "index_learning_objectives_on_domain_id"
    t.index ["parent_id"], name: "index_learning_objectives_on_parent_id"
  end

  create_table "learning_progresses", force: :cascade do |t|
    t.integer "child_id", null: false
    t.integer "learning_objective_id", null: false
    t.integer "school_year_id", null: false
    t.string "status"
    t.date "observed_on"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_learning_progresses_on_child_id"
    t.index ["learning_objective_id"], name: "index_learning_progresses_on_learning_objective_id"
    t.index ["school_year_id"], name: "index_learning_progresses_on_school_year_id"
  end

  create_table "objective_grade_levels", force: :cascade do |t|
    t.integer "learning_objective_id", null: false
    t.integer "grade_level_id", null: false
    t.string "expectation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_level_id"], name: "index_objective_grade_levels_on_grade_level_id"
    t.index ["learning_objective_id", "grade_level_id"], name: "index_objective_grade_levels_unique", unique: true
    t.index ["learning_objective_id"], name: "index_objective_grade_levels_on_learning_objective_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer "child_id", null: false
    t.integer "activity_id", null: false
    t.integer "learning_objective_id", null: false
    t.date "observed_at"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_observations_on_activity_id"
    t.index ["child_id"], name: "index_observations_on_child_id"
    t.index ["learning_objective_id"], name: "index_observations_on_learning_objective_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "child_id", null: false
    t.integer "school_year_id", null: false
    t.string "title"
    t.date "period_start"
    t.date "period_end"
    t.text "summary"
    t.json "data_snapshot", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_reports_on_child_id"
    t.index ["school_year_id"], name: "index_reports_on_school_year_id"
  end

  create_table "school_years", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "children"
  add_foreign_key "activity_objectives", "activities"
  add_foreign_key "activity_objectives", "learning_objectives"
  add_foreign_key "child_school_years", "children"
  add_foreign_key "child_school_years", "grade_levels"
  add_foreign_key "child_school_years", "school_years"
  add_foreign_key "domains", "subjects"
  add_foreign_key "grade_levels", "cycles"
  add_foreign_key "learning_objectives", "curriculum_versions"
  add_foreign_key "learning_objectives", "domains"
  add_foreign_key "learning_objectives", "learning_objectives", column: "parent_id"
  add_foreign_key "learning_progresses", "children"
  add_foreign_key "learning_progresses", "learning_objectives"
  add_foreign_key "learning_progresses", "school_years"
  add_foreign_key "objective_grade_levels", "grade_levels"
  add_foreign_key "objective_grade_levels", "learning_objectives"
  add_foreign_key "observations", "activities"
  add_foreign_key "observations", "children"
  add_foreign_key "observations", "learning_objectives"
  add_foreign_key "reports", "children"
  add_foreign_key "reports", "school_years"
end
