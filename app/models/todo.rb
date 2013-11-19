class Todo < ActiveRecord::Base
  attr_accessible :description, :title
  # attr_accessor :completed_percents

  has_many :steps

  def completed_percents
    steps_count = steps.count
    if steps_count > 0
      finished_count = steps.find_all { |step| step.completed == true }.size
      (100 * (finished_count / steps_count)).round(0)
    else
      completed ? 100 : 0
    end
  end
end
