class Todo < ActiveRecord::Base
  attr_accessible :completed_percents, :description, :title, :parent_id

  # has_many :steps
  belongs_to :parent, class_name: 'Todo'
  has_many :sub_todos, class_name: 'Todo', foreign_key: 'parent_id'
end
