# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160720193727) do

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "user_id"
    t.integer  "tuition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["tuition_id"], name: "index_payments_on_tuition_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "student_classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "meets_on"
    t.time     "start_time"
    t.time     "end_time"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "student_class_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "birthday"
    t.integer  "user_id"
  end

  add_index "students", ["student_class_id"], name: "index_students_on_student_class_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "supplies", force: :cascade do |t|
    t.string   "name"
    t.date     "date_due"
    t.string   "amount"
    t.integer  "student_class_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "supplies", ["student_class_id"], name: "index_supplies_on_student_class_id"

  create_table "tuitions", force: :cascade do |t|
    t.decimal  "cost"
    t.integer  "student_class_id"
    t.datetime "due_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "role",                   default: 0
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
