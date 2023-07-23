class SubtasksController < ApplicationController
  http_basic_authenticate_with name: "subtask_admin", password: "123", only: :destroy
   
    def create
        @task = Task.find(params[:task_id])
        @subtask = @task.subtasks.create!(subtask_params)   #creating a subtask
        redirect_to task_path(@task)   #redirecting to the show.html
      end

      def destroy
        @task = Task.find(params[:task_id])
        @subtask = @task.subtasks.find(params[:id])
        @subtask.destroy
        redirect_to task_path(@task), status: :see_other
      end

      def edit                           #updates a task
        @task = Task.find(params[:task_id])
      end
    
      def update                          # the is not working
        @task = Task.find(params[:task_id])
        @subtask = @task.subtasks.find(params[:id])
        if @subtask.update(subtask_params)
          redirect_to task_path(@task), status: :see_other
        else
          render :edit, status: :unprocessable_entity
        end
      end

      private
        def subtask_params
          params.require(:subtask).permit(:title, :completed)
      end
end
