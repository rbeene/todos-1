class TodosController < ApplicationController
  before_filter :authenticate, only: [:create]

  def index
    @todos = TodoDecorator.decorate(current_user.todos)
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(params[:todo])
    todo.user = current_user
    todo.save
    redirect_to todos_path
  end
end
