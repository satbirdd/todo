class AddStepIdToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :step_id, :integer
  end
end
