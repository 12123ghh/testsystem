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

ActiveRecord::Schema.define(version: 2019_04_02_161317) do

  create_table "answers", force: :cascade do |t|
    t.integer "exam_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_right_answer", default: false
    t.integer "option_id"
    t.text "content"
    t.boolean "true_answer"
    t.integer "question_type", default: 0
    t.index ["exam_id"], name: "index_answers_on_exam_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
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
    t.integer "question_number"
    t.integer "total_points"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.integer "user_id"
    t.integer "review", default: 0
    t.integer "creator_id"
    t.integer "level", default: 0
    t.integer "subject_id"
    t.integer "multiple_choice_count", default: 0
    t.integer "sentence_completion_count", default: 0
    t.integer "true_or_flase_question_count", default: 0
    t.integer "short_answer_question_count", default: 0
    t.index ["creator_id"], name: "index_papers_on_creator_id"
    t.index ["subject_id"], name: "index_papers_on_subject_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "papers_questions", force: :cascade do |t|
    t.integer "paper_id"
    t.integer "question_id"
    t.index ["paper_id"], name: "index_papers_questions_on_paper_id"
    t.index ["question_id"], name: "index_papers_questions_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.integer "level", default: 0
    t.integer "question_type", default: 0
    t.text "standard_answer"
    t.boolean "true_answer"
    t.index ["subject_id"], name: "index_questions_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
