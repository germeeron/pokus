class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
    
    # GET /categories
    def index
        @categories = current_user.categories
    end

    # GET /categories/new
    def new
        @category = Category.new
    end

    # POST /categories
    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    # GET /categories/:id
    def show
        @tasks = @category.tasks                            # concise
        # @tasks = Task.where(category_id: @category.id)    # verbose    
    end
   
    # GET /categories/:id/edit
    def edit
    end
    
    # PATCH /categories/:id
    def update
        # @category = Category.find(params[:id])

        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    # DELETE /categories/:id
    def destroy
        # @category = Category.find(params[:id])
        
        @category.destroy

        redirect_to root_path, status: :see_other
    end

    private

    # use callbacks to share common setup or constraints between actions
    def set_category
        @category = current_user.categories.find(params[:id])
        # @category = Category.find(params[:id])
    end

    # only allow a list of trusted parameters through
    def category_params
        params.require(:category).permit(:title)
    end
end