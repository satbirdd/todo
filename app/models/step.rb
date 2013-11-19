class Step < ActiveRecord::Base
  attr_accessible :title, :todo_id, :completed

  belongs_to :todo
end
