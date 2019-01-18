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

ActiveRecord::Schema.define(version: 2014_06_17_220936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kanban_milestones", id: :serial, force: :cascade do |t|
    t.string "kms_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kanban_id"
    t.index ["kanban_id"], name: "index_kanban_milestones_on_kanban_id"
  end

  create_table "kanbans", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_kanbans_on_user_id_and_created_at"
  end

  create_table "milestones", id: :serial, force: :cascade do |t|
    t.string "milestone_key"
    t.string "milestone_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kanban_milestone_id"
    t.integer "task_id"
    t.index ["kanban_milestone_id"], name: "index_milestones_on_kanban_milestone_id"
    t.index ["task_id"], name: "index_milestones_on_task_id"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "kanban_id"
    t.index ["kanban_id"], name: "index_taggings_on_kanban_id"
    t.index ["task_id"], name: "index_taggings_on_task_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "admin"
    t.boolean "guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
