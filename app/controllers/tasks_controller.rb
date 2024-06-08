class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.have_not_done_yet!
    if @task.save
      redirect_to tasks_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
