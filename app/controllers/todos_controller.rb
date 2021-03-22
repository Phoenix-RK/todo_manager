class TodosController < ApplicationController



  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}. #{due_date.to_s(:long)}. #{is_completed}"
  end

  def index
    #render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant_string}.join("\n")
    render "index"  #this goes to views folder and finds the todos directory and inside that it looks for index.html.erb
  end


  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
    #render "todo"
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

end
