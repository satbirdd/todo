class Todo < ActiveRecord::Base
  attr_accessible :completed_percents, :description, :title

  has_many :steps
end
