class TasksController < ApplicationController
  def index
    @task = Task.new(date_completed: parse_date_param)
    @tasks = Task.all.where(date_completed: parse_date_param)
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path(date: @task.date_completed)
    else
      redirect_to tasks_path(date: params[:date_completed])
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.delete
      redirect_to tasks_path(date: @task.date_completed)
    else
      redirect_to request.referer
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :date_completed)
  end

  def parse_date_param
    date = params.fetch(:date, nil)
    date ? date.to_date : Date.today
  rescue ArgumentError
    Date.today
  end
end
