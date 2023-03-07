# frozen_string_literal: true

create_table 'companies',
             comment: '会社',
             charset: 'utf8mb4',
             collation: 'utf8mb4_0900_as_cs',
             force: :cascade do |t|
  t.string 'name', null: false, comment: '会社名'
  t.string 'tel', null: false, comment: '会社連絡先'
  t.string 'email', null: false, comment: '会社メールアドレス'
  t.string 'address', null: false, comment: '会社住所'
  t.timestamp 'created_at', null: false, default: -> { 'CURRENT_TIMESTAMP' }
  t.timestamp 'updated_at', null: false, default: -> { 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP' }
end
