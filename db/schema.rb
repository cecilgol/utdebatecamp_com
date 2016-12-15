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

ActiveRecord::Schema.define(version: 20161215143058) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "cell_phone"
    t.string   "other_phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "territory"
    t.string   "country"
    t.date     "birthday"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.string   "email"
    t.string   "carrier"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id", using: :btree
    t.index ["user_id"], name: "index_accounts_on_user_id", using: :btree
  end

  create_table "camps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nickname"
    t.text     "info",                limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "glossy_file_name"
    t.string   "glossy_content_type"
    t.integer  "glossy_file_size"
    t.datetime "glossy_updated_at"
    t.index ["nickname"], name: "index_camps_on_nickname", unique: true, using: :btree
  end

  create_table "coaches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "account_id"
    t.string   "school_name"
    t.string   "school_state"
    t.string   "school_phone"
    t.integer  "added_by_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id"], name: "index_coaches_on_account_id", using: :btree
  end

  create_table "coaches_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "coach_id",   null: false
    t.integer "student_id", null: false
    t.index ["student_id", "coach_id"], name: "index_coaches_students_on_student_id_and_coach_id", using: :btree
  end

  create_table "directors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "account_id"
    t.integer  "camp_id"
    t.string   "official_phone"
    t.string   "official_email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "eid"
    t.index ["account_id"], name: "index_directors_on_account_id", using: :btree
    t.index ["camp_id"], name: "index_directors_on_camp_id", using: :btree
  end

  create_table "employee_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "employee_id"
    t.integer  "camp_id"
    t.integer  "program_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["camp_id"], name: "index_employee_applications_on_camp_id", using: :btree
    t.index ["employee_id"], name: "index_employee_applications_on_employee_id", using: :btree
    t.index ["program_id"], name: "index_employee_applications_on_program_id", using: :btree
  end

  create_table "employee_forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "employee_id"
    t.string   "file_location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["employee_id"], name: "index_employee_forms_on_employee_id", using: :btree
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "camp_id"
    t.integer  "program_id"
    t.integer  "account_id"
    t.string   "title"
    t.date     "arrival_date"
    t.date     "leave_date"
    t.text     "bio",          limit: 65535
    t.string   "pronouns"
    t.string   "dorm"
    t.string   "eid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_hired"
    t.float    "compensation", limit: 24
    t.text     "references",   limit: 65535
    t.text     "experience",   limit: 65535
    t.string   "avatar_url",   limit: 40
    t.index ["account_id"], name: "index_employees_on_account_id", using: :btree
    t.index ["camp_id"], name: "index_employees_on_camp_id", using: :btree
    t.index ["program_id"], name: "index_employees_on_program_id", using: :btree
  end

  create_table "faqs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "question",   limit: 65535
    t.text     "answer",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "lab_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "lab_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_lab_students_on_lab_id", using: :btree
    t.index ["student_id"], name: "index_lab_students_on_student_id", using: :btree
  end

  create_table "labs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "program_id"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_labs_on_program_id", using: :btree
  end

  create_table "news_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "account_id"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_news_posts_on_account_id", using: :btree
  end

  create_table "parents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "account_id"
    t.string   "preferred_contact_method"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "added_by_id",              null: false
    t.index ["account_id"], name: "index_parents_on_account_id", using: :btree
  end

  create_table "parents_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "parent_id",  null: false
    t.integer "student_id", null: false
    t.index ["student_id", "parent_id"], name: "index_parents_students_on_student_id_and_parent_id", using: :btree
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "camp_id"
    t.string   "name"
    t.string   "nickname"
    t.text     "info",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "price",      limit: 24
    t.date     "start_date"
    t.date     "end_date"
    t.string   "old_link"
    t.index ["camp_id"], name: "index_programs_on_camp_id", using: :btree
  end

  create_table "site_administrators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "account_id"
    t.datetime "promoted_at", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "eid"
    t.index ["account_id"], name: "index_site_administrators_on_account_id", using: :btree
  end

  create_table "student_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "student_id"
    t.integer  "camp_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_student_applications_on_camp_id", using: :btree
    t.index ["program_id"], name: "index_student_applications_on_program_id", using: :btree
    t.index ["student_id"], name: "index_student_applications_on_student_id", using: :btree
  end

  create_table "student_forms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "student_id"
    t.string   "file_location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["student_id"], name: "index_student_forms_on_student_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "camp_id"
    t.integer  "account_id"
    t.string   "gender"
    t.string   "pronouns"
    t.string   "dorm"
    t.string   "high_school"
    t.date     "arrival_date"
    t.date     "leave_date"
    t.string   "arrival_means"
    t.string   "leave_means"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "is_admitted"
    t.string   "eid"
    t.integer  "grade"
    t.index ["account_id"], name: "index_students_on_account_id", using: :btree
    t.index ["camp_id"], name: "index_students_on_camp_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "coaches", "accounts"
  add_foreign_key "directors", "accounts"
  add_foreign_key "directors", "camps"
  add_foreign_key "employee_applications", "camps"
  add_foreign_key "employee_applications", "employees"
  add_foreign_key "employee_applications", "programs"
  add_foreign_key "employee_forms", "employees"
  add_foreign_key "employees", "accounts"
  add_foreign_key "employees", "camps"
  add_foreign_key "employees", "programs"
  add_foreign_key "lab_students", "labs"
  add_foreign_key "lab_students", "students"
  add_foreign_key "labs", "programs"
  add_foreign_key "news_posts", "accounts"
  add_foreign_key "parents", "accounts"
  add_foreign_key "programs", "camps"
  add_foreign_key "site_administrators", "accounts"
  add_foreign_key "student_applications", "camps"
  add_foreign_key "student_applications", "programs"
  add_foreign_key "student_applications", "students"
  add_foreign_key "student_forms", "students"
  add_foreign_key "students", "accounts"
  add_foreign_key "students", "camps"
end
