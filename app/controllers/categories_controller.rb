class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(5)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to @category
    else
      render 'new'
    end
  end
end
