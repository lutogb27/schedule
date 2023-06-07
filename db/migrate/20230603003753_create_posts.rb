class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.datetime "start_at", null: false
      t.datetime "end_at", null: false
      t.boolean "is_all_day"
      t.timestamps
      t.text "memo"
      t.string "title"
    end
  end
end
