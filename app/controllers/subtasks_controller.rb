class SubtasksController < ApplicationController
    def create
        @task = Task.find(params[:task_id])
        @subtask = @task.subtasks.create(subtask_params)   #creating a comment
        redirect_to task_path(@task)
      end
    
      private
        def subtask_params
          params.require(:subtask).permit(:title, :completed)
      end
end
