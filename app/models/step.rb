class Step < ActiveRecord::Base
  attr_accessible :title, :todo_id, :completed

  belongs_to :todo

  has_one :sub_todo, class_name: "Todo", foreign_key: "step_id"

  def has_sub_todo?
    return !!sub_todo
  end
end
