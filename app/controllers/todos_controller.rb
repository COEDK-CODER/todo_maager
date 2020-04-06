class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
    #render plain: Todo.order(:due_date).map { |todo| todo.to_formatted_string }.join("\n")
  end

  def show
    render plain: Todo.find(params[:id]).to_formatted_string
  end

  def create
    new_todo = Todo.create!(todo_text: params[:todo_text], due_date: Date.parse(params[:due_date]), completed: "false")
    render plain: "A new todo created successfully with ID_NO #{new_todo.id}"
  end

  def update
    todo = Todo.find(params[:id])
    todo.completed = params[:completed]
    todo.save!
    render plain: " #{todo.todo_text} is updated successfully.... "
  end
end
