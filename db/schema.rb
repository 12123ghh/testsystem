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

ActiveRecord::Schema.define(version: 2019_02_27_112815) do

  create_table "answers", force: :cascade do |t|
    t.integer "exam_id"
    t.integer "question_id"
    t.text "content"
    t.float "accuracy", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_right_answer", default: false
    t.index ["exam_id"], name: "index_answers_on_exam_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "paper_id"
    t.datetime "finished_at"
    t.integer "state", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_exams_on_paper_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.text "content"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_right_answer", default: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "papers", force: :cascade do |t|
    t.text "subject"
    t.integer "question_number"
    t.integer "total_points"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.integer "user_id"
    t.integer "review"
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_papers_on_creator_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paper_id"
    t.index ["paper_id"], name: "index_questions_on_paper_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
