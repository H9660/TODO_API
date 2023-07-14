class TasksController < ApplicationController   #This application file is globally available
  # Here the task is representing our data
  def index    #these are called actions
    @tasks = Task.all                  #returns all the tasks
    # render json: @tasks, status: :created, location: @task 
  end

  def show
    @task = Task.find(params[:id])    #returns a task with a given id
    # render json: @task, status: :created, location: @task 
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created, location: @task 
      # redirect_to @task   #if the save is successful then we are redirected to the task page
    else
      render json: @task.errors,  status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end