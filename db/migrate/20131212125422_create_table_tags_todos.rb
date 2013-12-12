class CreateTableTagsTodos < ActiveRecord::Migration
  def up
    create_table :tags_todos do |t|
      t.integer :todo_id
      t.integer :tag_id
    end
  end

  def down
  end
end
