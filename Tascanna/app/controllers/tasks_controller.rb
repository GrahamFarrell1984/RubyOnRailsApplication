class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only:[:edit, :update, :show, :destroy] # Before doing anything set the task for the edit, update, show, and destroy methods

    def index
        @tasks = current_user.tasks # Get all tasks for a specific user
    end

    def new
        @task = Task.new
    end

    def create
        @task = current_user.tasks.new(tasks_params) # Create a task associated with the current user that is logged in
        if @task.save
            flash[:notice] = "Task was successfully created"
            redirect_to task_path(@task)
        else
            render 'new'
        end
    end

    def update
        if @task.update(tasks_params)
            flash[:notice] = "Task was successfully updated"
            redirect_to task_path(@task)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @task.destroy
        flash[:notice] = "Task was successfully deleted"
        redirect_to tasks_path
    end

    def edit
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def tasks_params
        params.require(:task).permit(:content)
    end

end
