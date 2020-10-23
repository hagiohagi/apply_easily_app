# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_124411) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "parttimes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "sun_parttime_in"
    t.integer "sun_parttime_out"
    t.integer "mon_parttime_in"
    t.integer "mon_parttime_out"
    t.integer "tue_parttime_in"
    t.integer "tue_parttime_out"
    t.integer "wed_parttime_in"
    t.integer "wed_parttime_out"
    t.integer "thu_parttime_in"
    t.integer "thu_parttime_out"
    t.integer "fri_parttime_in"
    t.integer "fri_parttime_out"
    t.integer "sat_parttime_in"
    t.integer "sat_parttime_out"
    t.string "pr_1", null: false
    t.string "pr_2", null: false
    t.string "pr_3", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parttimes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.string "email", null: false
    t.string "sex", null: false
    t.date "birth_day", null: false
    t.string "phone_number", null: false
    t.integer "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "building"
    t.string "highschool", null: false
    t.integer "h_admission", null: false
    t.integer "h_graduate"
    t.string "univercity"
    t.integer "u_admission"
    t.integer "u_graduate"
    t.text "job_experience"
    t.string "qualification_1"
    t.integer "q_year_1"
    t.string "qualification_2"
    t.integer "q_year_2"
    t.string "qualification_3"
    t.integer "q_year_3"
    t.string "station"
    t.string "spouse", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "parttimes", "users"
end
