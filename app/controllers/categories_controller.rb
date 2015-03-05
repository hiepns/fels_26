class CategoriesController < ApplicationController
  before_action :logged_in_user
  def index
    @categories_list = Category.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
