class TasksController < ApplicationController
  before_action :set_tasks, only: [:index, :create]

  def index
    @task = Task.new
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
      @q = Task.ransack(params[:q])
      @tasks = if params[:q].present?
                 @q.result
               else
                 Task.all
               end
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
