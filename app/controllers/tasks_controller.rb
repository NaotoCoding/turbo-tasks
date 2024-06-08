class TasksController < ApplicationController
  before_action :set_tasks, only: [:index, :create]

  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.status = :have_not_done_yet
    if @task.save
      redirect_to tasks_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

    def set_tasks
      @tasks = Task.all
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
