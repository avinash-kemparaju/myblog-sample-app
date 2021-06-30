class CategoriesController < ApplicationController
  before_filter :require_admin, except: %i[show index]

  def index
    @categories = Category.page(params[:page]).per(5)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.page(params[:page]).per(3)
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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category updated successfully'
    else
      flash[:alert] = 'Category update failed'
    end
    redirect_to @category
  end

  private

  def require_admin
    unless signed_in? && current_user.role > 1
      flash[:alert] = 'Only admins are allowed'
      redirect_to categories_path
    end
  end
end
