class Todo < ActiveRecord::Base
  attr_accessible :description, :title, :step_id
  # attr_accessor :completed_percents

  has_many :steps
  belongs_to :parent_step, class_name: "Step", foreign_key: "step_id"

  def completed_percents
    steps_count = steps.count
    if steps_count > 0
      finished_count = steps.find_all { |step| step.completed == true }.size
      (100 * (finished_count.to_f / steps_count)).round(0)
    else
      completed ? 100 : 0
    end
  end
end
