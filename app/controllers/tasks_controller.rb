class TasksController < ApplicationController

  def index
    if current_user
      @tasks = current_user.tasks
    end
  end

  def create
    if current_user
      task_params = params.require(:task).permit(:text)
      @task = current_user.tasks.build(task_params)
      @task.status = 'active'
      @task.save
    else
      redirect_to root_path
    end
  end

  def update
    if current_user
      task_params = params.require(:task).permit(:status)
      @task = current_user.tasks.find_by_id(params[:id])
      if @task
        @task.update_attributes(task_params)
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      @task = current_user.tasks.find_by_id(params[:id])
      if @task
        @task.destroy
      end
    else
      redirect_to root_path
    end
  end


end
