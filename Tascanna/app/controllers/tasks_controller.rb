class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only:[:edit, :update, :show, :destroy, :change] # Before doing anything set the task for the edit, update, show, destroy, and change methods

    def index
        @to_do = current_user.tasks.where(state: 'to_do') # Get all tasks for a specific user where the state is equal to to do
        @doing = current_user.tasks.where(state: 'doing') # Get all tasks for a specific user where the state is equal to doing
        @done = current_user.tasks.where(state: 'done') # Get all tasks for a specific user where the state is equal to done
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

    def change
        @task.update_attributes(state: params[:state])
        flash[:notice] = "Task state was successfully changed"
        redirect_to tasks_path
    end

    def edit
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def tasks_params
        params.require(:task).permit(:content, :state)
    end

end
