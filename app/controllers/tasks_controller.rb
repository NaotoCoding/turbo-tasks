class TasksController < ApplicationController
  before_action :set_tasks, only: [:index, :create]

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = :have_not_done_yet
    if @task.save
      render :create_success
    else
      render turbo_stream: [
        turbo_stream.update("create-form", partial: "form", locals: { task: @task })
      ], status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    render turbo_stream: [
      turbo_stream.remove(@task)
    ]
  end

  private

    def set_tasks
      @q = Task.ransack(params[:q])
      tasks = if params[:q].present?
                @q.result
              else
                Task.all
              end
      @tasks = tasks.page(params[:page])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
