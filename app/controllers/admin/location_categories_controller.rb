module Admin
  class LocationCategoriesController < BaseController

    before_action :set_location_category, only: [:show, :edit, :update, :destroy]

    def index
      @location_categories = LocationCategory.all
    end

    def show
    end

    def new
      @location_category = LocationCategory.new
    end

    def create
      @location_category = LocationCategory.new(location_category_params)

      if @location_category.save
        redirect_to admin_location_categories_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @location_category.update(location_category_params)
        redirect_to admin_location_categories_path
      else
        render :edit
      end
    end

    def destroy
      @location_category.destroy

      redirect_to admin_location_categories_path
    end

    private

    def set_location_category
      @location_category = LocationCategory.find(params[:id])
    end

    def location_category_params
      if params[:location_category].present?
        params[:location_category].permit(:name)
      else
        {}
      end
    end

  end
end
