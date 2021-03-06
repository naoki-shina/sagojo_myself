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

ActiveRecord::Schema.define(version: 20180314040834) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "image_url",              limit: 65535
    t.text     "introduction",           limit: 65535
    t.text     "work_content",           limit: 65535
    t.string   "reward"
    t.text     "other_reward",           limit: 65535
    t.text     "requirements",           limit: 65535
    t.string   "num_people"
    t.string   "travel_period"
    t.string   "area"
    t.string   "company"
    t.text     "other",                  limit: 65535
    t.text     "application_deadline",   limit: 65535
    t.text     "responsible_party_icon", limit: 65535
    t.text     "single_word",            limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "job_tag_id"
    t.text     "thumbnail",              limit: 65535
  end

  create_table "job_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "job_tag_type"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_likes_on_article_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                         null: false
    t.string   "avatar"
    t.string   "background_image"
    t.string   "catch_phrase"
    t.integer  "birth_date_y"
    t.integer  "birth_date_m"
    t.integer  "birth_date_d"
    t.integer  "sex"
    t.integer  "tel"
    t.integer  "post_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "address4"
    t.string   "present_place"
    t.string   "private_link"
    t.integer  "pv"
    t.string   "sns"
    t.integer  "follower"
    t.integer  "job_type_tags_1"
    t.integer  "job_type_tags_2"
    t.integer  "job_type_tags_3"
    t.integer  "job_type_tags_4"
    t.text     "job_type_else",     limit: 65535
    t.text     "language",          limit: 65535
    t.text     "job_history",       limit: 65535
    t.text     "travel_history",    limit: 65535
    t.integer  "skill_tags_1"
    t.integer  "skill_tags_2"
    t.integer  "skill_tags_3"
    t.integer  "skill_tags_4"
    t.text     "skill_tags_else",   limit: 65535
    t.text     "achievement",       limit: 65535
    t.string   "income"
    t.text     "preparation",       limit: 65535
    t.string   "travel_date"
    t.text     "travel_content",    limit: 65535
    t.text     "self_introduction", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "triplab_articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image_url",        limit: 65535
    t.string   "job_type_tag"
    t.string   "title"
    t.text     "writer_image_url", limit: 65535
    t.string   "writer_name"
    t.string   "up_date"
    t.integer  "view_number"
    t.string   "skill_tag_1"
    t.string   "skill_tag_2"
    t.string   "skill_tag_3"
    t.string   "skill_tag_4"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.integer  "magazine",                            null: false
    t.integer  "convention",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
end
