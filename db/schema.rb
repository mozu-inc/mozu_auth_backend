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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_as_cs", comment: "会社", force: :cascade do |t|
    t.string "name", null: false, comment: "会社名"
    t.string "tel", null: false, comment: "会社連絡先"
    t.string "email", null: false, comment: "会社メールアドレス"
    t.string "address", null: false, comment: "会社住所"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_as_cs", comment: "ユーザ", force: :cascade do |t|
    t.bigint "company_id", null: false, comment: "companies.id"
    t.string "name", null: false, comment: "氏名"
    t.string "tel", comment: "電話番号"
    t.string "email", null: false, comment: "ユーザメールアドレス"
    t.string "password", null: false, comment: "hashed password"
    t.string "refresh_token", null: false, comment: "認証のrefresh時に使用"
    t.string "line_user_id"
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.index ["company_id"], name: "fk_company_id_on_users"
    t.index ["email"], name: "uk_email_on_users", unique: true
    t.index ["line_user_id"], name: "uk_line_user_id_on_users", unique: true
  end

end
