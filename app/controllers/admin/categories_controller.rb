class Admin::CategoriesController < Admin::AdminsController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new cat_params
    if @category.save
      flash[:success] = "Created success"
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes cat_params
      flash[:success] = "Category updated"
      redirect_to admin_categories_url
    else
      render "edit"
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_url
  end
  private

  def cat_params
    params.require(:category).permit(:icon, :name, :total)
  end
end
