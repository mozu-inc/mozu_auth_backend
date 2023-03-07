# frozen_string_literal: true

create_table 'users',
             comment: 'ユーザ',
             charset: 'utf8mb4',
             collation: 'utf8mb4_0900_as_cs',
             force: :cascade do |t|
  t.bigint 'company_id', null: false, comment: 'companies.id'
  t.string 'name', null: false, comment: '氏名'
  t.string 'tel', null: true, comment: '電話番号'
  t.string 'email', null: false, comment: 'ユーザメールアドレス'
  t.string 'password', null: false, comment: 'hashed password'
  t.string 'refresh_token', null: false, comment: '認証のrefresh時に使用'
  t.string 'line_user_id', null: true, comment: ''
  t.timestamp 'created_at', null: false, default: -> { 'CURRENT_TIMESTAMP' }
  t.timestamp 'updated_at', null: false, default: -> { 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP' }

  t.index %w[email], unique: true, name: 'uk_email_on_users'
  t.index %w[line_user_id], unique: true, name: 'uk_line_user_id_on_users'

  t.index %w[company_id], name: 'fk_company_id_on_users'
end
