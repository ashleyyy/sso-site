# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 0) do
  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.text 'text'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'photo_url'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'avatar_url'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end
end
