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

ActiveRecord::Schema[7.1].define(version: 2025_01_27_161434) do
  create_table "bean_comment_votes", force: :cascade do |t|
    t.boolean "vote"
    t.integer "bean_comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_comment_id"], name: "index_bean_comment_votes_on_bean_comment_id"
    t.index ["user_id"], name: "index_bean_comment_votes_on_user_id"
  end

  create_table "bean_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id", null: false
    t.integer "bean_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_bean_comments_on_bean_id"
    t.index ["user_id"], name: "index_bean_comments_on_user_id"
  end

  create_table "bean_reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "user_id", null: false
    t.integer "bean_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_bean_reviews_on_bean_id"
    t.index ["user_id"], name: "index_bean_reviews_on_user_id"
  end

  create_table "beans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "roast_level"
    t.string "brewing_method"
    t.integer "user_id", null: false
    t.integer "roastery_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roastery_id"], name: "index_beans_on_roastery_id"
    t.index ["user_id"], name: "index_beans_on_user_id"
  end

  create_table "favourite_beans", force: :cascade do |t|
    t.integer "bean_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bean_id"], name: "index_favourite_beans_on_bean_id"
    t.index ["user_id"], name: "index_favourite_beans_on_user_id"
  end

  create_table "favourite_roasteries", force: :cascade do |t|
    t.integer "roastery_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roastery_id"], name: "index_favourite_roasteries_on_roastery_id"
    t.index ["user_id"], name: "index_favourite_roasteries_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "type"
    t.integer "Roastery_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Roastery_id"], name: "index_locations_on_Roastery_id"
  end

  create_table "roasteries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "address"
    t.string "roastery_url"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roasteries_on_user_id"
  end

  create_table "roastery_comment_votes", force: :cascade do |t|
    t.boolean "vote"
    t.integer "user_id", null: false
    t.integer "roastery_comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roastery_comment_id"], name: "index_roastery_comment_votes_on_roastery_comment_id"
    t.index ["user_id"], name: "index_roastery_comment_votes_on_user_id"
  end

  create_table "roastery_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "roastery_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roastery_id"], name: "index_roastery_comments_on_roastery_id"
    t.index ["user_id"], name: "index_roastery_comments_on_user_id"
  end

  create_table "roastery_reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "roastery_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roastery_id"], name: "index_roastery_reviews_on_roastery_id"
    t.index ["user_id"], name: "index_roastery_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.text "bio"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bean_comment_votes", "bean_comments"
  add_foreign_key "bean_comment_votes", "users"
  add_foreign_key "bean_comments", "beans"
  add_foreign_key "bean_comments", "users"
  add_foreign_key "bean_reviews", "beans"
  add_foreign_key "bean_reviews", "users"
  add_foreign_key "beans", "roasteries"
  add_foreign_key "beans", "users"
  add_foreign_key "favourite_beans", "beans"
  add_foreign_key "favourite_beans", "users"
  add_foreign_key "favourite_roasteries", "roasteries"
  add_foreign_key "favourite_roasteries", "users"
  add_foreign_key "locations", "Roasteries"
  add_foreign_key "roasteries", "users"
  add_foreign_key "roastery_comment_votes", "roastery_comments"
  add_foreign_key "roastery_comment_votes", "users"
  add_foreign_key "roastery_comments", "roasteries"
  add_foreign_key "roastery_comments", "users"
  add_foreign_key "roastery_reviews", "roasteries"
  add_foreign_key "roastery_reviews", "users"
end
