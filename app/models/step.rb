class Step < ActiveRecord::Base
  attr_accessible :title, :todo_id, :completed

  belongs_to :todo

  has_one :sub_todo, class_name: "Todo", foreign_key: "step_id"

  def has_sub_todo?
    return !!sub_todo
  end

  def check_complete_status
    is_sub_todo_completed = sub_todo.completed
    update_attribute("completed", is_sub_todo_completed)
  end
end
