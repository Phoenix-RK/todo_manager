
class Todo < ActiveRecord::Base
  def due_later?
    due_date > Date.today
  end

  def due_today?
    due_date == Date.today
  end

  def overdue?
    due_date < Date.today
  end

  def self.is_complete
    all.where(completed: true)
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end
  def self.due_later
    all.where("due_date > ?", Date.today)
  end
  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue"
    temp = Todo.all.filter {|todo| todo.overdue?}
    puts temp.map {|todo| todo.to_displayable_string}

    puts "Due today"
    temp = Todo.all.filter {|todo| todo.due_today?}
    puts temp.map {|todo| todo.to_displayable_string}

    puts "Due later"
    temp = Todo.all.filter {|todo| todo.due_later?}
    puts temp.map {|todo| todo.to_displayable_string}
  end

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}. #{due_date.to_s(:long)}. #{is_completed}"
  end
end
