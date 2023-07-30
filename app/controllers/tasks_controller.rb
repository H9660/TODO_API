class TasksController < ApplicationController  
  
  #This application file is globally available
  # Here the task is representing our data
  # http_basic_authenticate_with name: "task_admin", password: "123", except: [:index, :show, :destroy]

  def index    #these are called actions
    @tasks = Task.all                  #returns all the tasks
    # render json: @tasks, status: :created, location: @task    #rendering data in JSON format
  end

  def show
    @task = Task.find(params[:id])    #returns a task with a given id
    # render json: @task, status: :created, location: @task 
  end
  
  def new
    @task = Task.new
  end

  def create                         #creates a task
    @task = Task.new(task_params)
    if @task.save
      # render json: @task, status: :created, location: @task   #rendering data in JSON format
      redirect_to @task   #if the save is successful then we are redirected to the task page
    else
      render json: @task.errors,  status: :unprocessable_entity
    end
  end

  def edit                           #updates a task
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
  
  def destroy                      # Deletes a task
    @task= Task.find(params[:id])
    @task.destroy

    redirect_to root_path, status: :see_other
  end
  
    
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end