class Todo < ActiveRecord::Base
  attr_accessible :description, :title, :step_id, :completed
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

  def check_complete_status
    is_completed = steps.all? { |step| step.completed }
    update_attribute("completed", is_completed)
    update_parent_step_status
  end

  def update_parent_step_status
    parent_step.check_complete_status if parent_step
  end

  def not_completed?
    !completed
  end
end
