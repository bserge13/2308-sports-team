# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Project schema: 
create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.integer "age"
    t.string "hometown"
    t.boolean "all_star"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "city"
    t.boolean "expansion_team"
    t.integer "number_of_titles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "players", "teams"
end

Relationship design link: 
https://dbdiagram.io/d/6521c6b8ffbf5169f03d7180