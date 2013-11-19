class RemoveCompletedPercentsFromTodo < ActiveRecord::Migration
  def up
    remove_column :todos, :completed_percents
  end

  def down
    add_column :todos, :completed_percents, :integer
  end
end
