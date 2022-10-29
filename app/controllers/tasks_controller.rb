class TasksController < ApplicationController
    before_action :set_category, except: :today
    before_action :set_task, only: %i[ show edit update destroy ]

    # POST /categories
    def create
        @task = @category.tasks.create(task_params)
        # redirect_to category_path(@category)

        respond_to do |format|
            if @task.save
                format.html { redirect to @task.post }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    # GET /categories/:id/edit
    def edit
    end
    
    # GET /categories/:id
    def show
    end

    # PATCH /categories/:id
    def update
        if @task.update(task_params)
            redirect_to category_task_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy 
        @task.destroy
        redirect_to category_path(@category)
    end

    def today
        @today = current_user.tasks.where(deadline: Date.current)
    end
    
    def due_today 
        @categories = current_user.categories
        @tasks = @categories.tasks
        @datetoday = Date.current
        @today = @tasks.where('due_date = ?', @datetoday)
    end

    private

    def task_params
        params.require(:task).permit(:name, :notes, :due_date, :complete)
    end

    def set_category
        @category = current_user.categories.find(params[:category_id])
    end

    def set_task
        @task = @category.tasks.find(params[:id])
    end
end
