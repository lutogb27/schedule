class AdditionPosts < ActiveRecord::Migration[6.1]
  def up
    add_column :is_all_day, :boolen
  end

  def down
    remove_column :is_all_day, :datetime, default: false, null: false
  end
end
