class TodosController < ApplicationController

  skip_before_action :verify_authenticity_token

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text}. #{due_date.to_s(:long)}. #{is_completed}"
  end

  def index
    #render plain: Todo.order(:due_date).map {|todo| todo.to_pleasant_string}.join("\n")
    render "index"  #this goes to views folder and finds the todos directory and inside that it looks for index.html.erb
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!( todo_text: todo_text, due_date:due_date, completed: false,)
    redirect_to todos_path
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
    #render "todo"
  end

  def update
    id = params[:id]
    completed = params[:completed] ? params[:completed] : false
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path

  end
end
