class TasksController < ApplicationController
  before_action 
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new = Task.new # Needed to instantiate the form_with
  end

  def create

    @new = Task.new(task_params)
    @new.save #save the new task and redirect
    redirect_to tasks_path

  end

  def edit
    @edit = Task.find(params[:id])
  end

  def update
    @edit = Task.find(params[:id])
    @edit.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @delete = Task.find(params[:id])
    @delete.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)

  end

end
