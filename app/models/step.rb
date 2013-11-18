class Step < ActiveRecord::Base
  attr_accessible :percents, :title, :todo_id

  belongs_to :todo
end
