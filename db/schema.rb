# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170517184325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "cell_phone", null: false
    t.string "other_phone"
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "city", null: false
    t.string "state"
    t.string "territory"
    t.string "country", default: "US"
    t.date "birthday"
    t.integer "user_id"
    t.string "accountable_type"
    t.integer "accountable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "carrier"
    t.string "zipcode"
    t.string "home_phone"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "camps", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.text "info"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "glossy_file_name"
    t.string "glossy_content_type"
    t.integer "glossy_file_size"
    t.datetime "glossy_updated_at"
    t.string "info_blurb"
    t.string "staff_blurb"
    t.hstore "oblique"
    t.index ["nickname"], name: "index_camps_on_nickname", unique: true
    t.index ["oblique"], name: "index_camps_on_oblique", using: :gin
  end

  create_table "coaches", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "school_name"
    t.string "school_state"
    t.string "school_phone"
    t.integer "added_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_coaches_on_account_id"
  end

  create_table "coaches_students", id: false, force: :cascade do |t|
    t.integer "coach_id", null: false
    t.integer "student_id", null: false
    t.index ["student_id", "coach_id"], name: "index_coaches_students_on_student_id_and_coach_id"
  end

  create_table "directors", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "camp_id"
    t.string "official_phone"
    t.string "official_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eid"
    t.index ["account_id"], name: "index_directors_on_account_id"
    t.index ["camp_id"], name: "index_directors_on_camp_id"
  end

  create_table "emergency_contacts", id: false, force: :cascade do |t|
    t.bigint "student_id"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_emergency_contacts_on_student_id"
  end

  create_table "employee_forms", id: :serial, force: :cascade do |t|
    t.integer "employee_id"
    t.string "file_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_forms_on_employee_id"
  end

  create_table "employee_program_assignments", id: :serial, force: :cascade do |t|
    t.integer "employee_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_program_assignments_on_employee_id"
    t.index ["program_id"], name: "index_employee_program_assignments_on_program_id"
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.integer "camp_id"
    t.integer "program_id"
    t.integer "account_id"
    t.string "title"
    t.date "arrival_date"
    t.date "leave_date"
    t.text "bio"
    t.string "pronouns"
    t.string "dorm"
    t.string "eid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_hired", default: false
    t.float "compensation"
    t.text "references"
    t.text "experience"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["account_id"], name: "index_employees_on_account_id"
    t.index ["camp_id"], name: "index_employees_on_camp_id"
    t.index ["program_id"], name: "index_employees_on_program_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "camp_id"
    t.integer "program_id"
    t.jsonb "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.boolean "display_overview"
    t.index "date(start_date)", name: "event_start_date_idx"
    t.index ["camp_id"], name: "index_events_on_camp_id"
    t.index ["program_id"], name: "index_events_on_program_id"
    t.index ["schedule"], name: "index_events_on_schedule", using: :gin
  end

  create_table "faqs", id: :serial, force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_students", id: :serial, force: :cascade do |t|
    t.integer "lab_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_lab_students_on_lab_id"
    t.index ["student_id"], name: "index_lab_students_on_student_id"
  end

  create_table "labs", id: :serial, force: :cascade do |t|
    t.integer "program_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_labs_on_program_id"
  end

  create_table "news_posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "account_id"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_news_posts_on_account_id"
  end

  create_table "parents", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "added_by_id"
    t.string "preferred_contact_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_parents_on_account_id"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.integer "parent_id", null: false
    t.integer "student_id", null: false
    t.index ["student_id", "parent_id"], name: "index_parents_students_on_student_id_and_parent_id"
  end

  create_table "program_student_assignments", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_student_assignments_on_program_id"
    t.index ["student_id"], name: "index_program_student_assignments_on_student_id"
  end

  create_table "programs", id: :serial, force: :cascade do |t|
    t.integer "camp_id"
    t.string "name"
    t.string "nickname"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.date "start_date"
    t.date "end_date"
    t.string "old_link"
    t.index ["camp_id"], name: "index_programs_on_camp_id"
  end

  create_table "site_administrators", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.datetime "promoted_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eid"
    t.index ["account_id"], name: "index_site_administrators_on_account_id"
  end

  create_table "student_forms", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.string "file_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "filed"
    t.boolean "treatment_consent"
    t.boolean "off_campus_permission"
    t.boolean "release_and_indemnification"
    t.boolean "witness"
    t.date "year"
    t.string "allergies"
    t.boolean "media_release"
    t.index ["student_id"], name: "index_student_forms_on_student_id"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.integer "camp_id"
    t.integer "account_id"
    t.string "gender"
    t.string "pronouns"
    t.string "dorm"
    t.string "high_school"
    t.date "arrival_date"
    t.date "leave_date"
    t.string "arrival_means"
    t.string "leave_means"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admitted"
    t.string "eid"
    t.integer "grade"
    t.string "diet"
    t.string "medicine_allergy"
    t.boolean "commuter"
    t.string "notes"
    t.index ["account_id"], name: "index_students_on_account_id"
    t.index ["camp_id"], name: "index_students_on_camp_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "coaches", "accounts"
  add_foreign_key "directors", "accounts"
  add_foreign_key "directors", "camps"
  add_foreign_key "emergency_contacts", "students"
  add_foreign_key "employee_forms", "employees"
  add_foreign_key "employee_program_assignments", "employees"
  add_foreign_key "employee_program_assignments", "programs"
  add_foreign_key "employees", "accounts"
  add_foreign_key "employees", "camps"
  add_foreign_key "employees", "programs"
  add_foreign_key "events", "camps"
  add_foreign_key "events", "programs"
  add_foreign_key "lab_students", "labs"
  add_foreign_key "lab_students", "students"
  add_foreign_key "labs", "programs"
  add_foreign_key "news_posts", "accounts"
  add_foreign_key "parents", "accounts"
  add_foreign_key "program_student_assignments", "programs"
  add_foreign_key "program_student_assignments", "students"
  add_foreign_key "programs", "camps"
  add_foreign_key "site_administrators", "accounts"
  add_foreign_key "student_forms", "students"
  add_foreign_key "students", "accounts"
  add_foreign_key "students", "camps"
end
