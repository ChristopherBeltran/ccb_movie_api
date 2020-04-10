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

ActiveRecord::Schema.define(version: 0) do

  create_table "actor", primary_key: "actor_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["last_name"], name: "idx_actor_last_name"
  end

  create_table "category", primary_key: "category_id", id: :integer, limit: 1, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 25, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "city", primary_key: "city_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city", limit: 50, null: false
    t.integer "country_id", limit: 2, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["country_id"], name: "idx_fk_country_id"
  end

  create_table "country", primary_key: "country_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "country", limit: 50, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "customer", primary_key: "customer_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "store_id", limit: 1, null: false, unsigned: true
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.string "email", limit: 50
    t.integer "address_id", limit: 2, null: false, unsigned: true
    t.boolean "active", default: true, null: false
    t.datetime "create_date", null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["address_id"], name: "idx_fk_address_id"
    t.index ["last_name"], name: "idx_last_name"
    t.index ["store_id"], name: "idx_fk_store_id"
  end

  create_table "film", primary_key: "film_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "release_year"
    t.integer "language_id", limit: 1, null: false, unsigned: true
    t.integer "original_language_id", limit: 1, unsigned: true
    t.integer "rental_duration", limit: 1, default: 3, null: false, unsigned: true
    t.decimal "rental_rate", precision: 4, scale: 2, default: "4.99", null: false
    t.integer "length", limit: 2, unsigned: true
    t.decimal "replacement_cost", precision: 5, scale: 2, default: "19.99", null: false
    t.string "rating", limit: 5, default: "G"
    t.string "special_features", limit: 54
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["language_id"], name: "idx_fk_language_id"
    t.index ["original_language_id"], name: "idx_fk_original_language_id"
    t.index ["title"], name: "idx_title"
  end

  create_table "film_actor", primary_key: ["actor_id", "film_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "actor_id", limit: 2, null: false, unsigned: true
    t.integer "film_id", limit: 2, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["film_id"], name: "idx_fk_film_id"
  end

  create_table "film_category", primary_key: ["film_id", "category_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id", limit: 2, null: false, unsigned: true
    t.integer "category_id", limit: 1, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["category_id"], name: "fk_film_category_category"
  end

  create_table "film_text", primary_key: "film_id", id: :integer, limit: 2, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.index ["title", "description"], name: "idx_title_description", type: :fulltext
  end

  create_table "inventory", primary_key: "inventory_id", id: :integer, limit: 3, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "film_id", limit: 2, null: false, unsigned: true
    t.integer "store_id", limit: 1, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["film_id"], name: "idx_fk_film_id"
    t.index ["store_id", "film_id"], name: "idx_store_id_film_id"
  end

  create_table "language", primary_key: "language_id", id: :integer, limit: 1, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "payment", primary_key: "payment_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "customer_id", limit: 2, null: false, unsigned: true
    t.integer "staff_id", limit: 1, null: false, unsigned: true
    t.integer "rental_id"
    t.decimal "amount", precision: 5, scale: 2, null: false
    t.datetime "payment_date", null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["customer_id"], name: "idx_fk_customer_id"
    t.index ["rental_id"], name: "fk_payment_rental"
    t.index ["staff_id"], name: "idx_fk_staff_id"
  end

  create_table "rental", primary_key: "rental_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "rental_date", null: false
    t.integer "inventory_id", limit: 3, null: false, unsigned: true
    t.integer "customer_id", limit: 2, null: false, unsigned: true
    t.datetime "return_date"
    t.integer "staff_id", limit: 1, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["customer_id"], name: "idx_fk_customer_id"
    t.index ["inventory_id"], name: "idx_fk_inventory_id"
    t.index ["rental_date", "inventory_id", "customer_id"], name: "rental_date", unique: true
    t.index ["staff_id"], name: "idx_fk_staff_id"
  end

  create_table "staff", primary_key: "staff_id", id: :integer, limit: 1, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.integer "address_id", limit: 2, null: false, unsigned: true
    t.binary "picture"
    t.string "email", limit: 50
    t.integer "store_id", limit: 1, null: false, unsigned: true
    t.boolean "active", default: true, null: false
    t.string "username", limit: 16, null: false
    t.string "password", limit: 40, collation: "utf8_bin"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["address_id"], name: "idx_fk_address_id"
    t.index ["store_id"], name: "idx_fk_store_id"
  end

  create_table "store", primary_key: "store_id", id: :integer, limit: 1, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "manager_staff_id", limit: 1, null: false, unsigned: true
    t.integer "address_id", limit: 2, null: false, unsigned: true
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["address_id"], name: "idx_fk_address_id"
    t.index ["manager_staff_id"], name: "idx_unique_manager", unique: true
  end

end
