class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}. #{due_date.to_s(:long)}. #{is_completed}"
  end
end
