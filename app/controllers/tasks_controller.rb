# frozen_string_literal: true
class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit; end

  def update
    if @task.update(tasks_params)
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
