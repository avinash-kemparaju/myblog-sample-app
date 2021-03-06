class ArticlesController < ApplicationController
  before_filter :set_article, only: %i[show edit update destroy]
  before_filter :require_user, except: %i[new show index]
  before_filter :require_correct_user, only: %i[edit update destroy]

  def index
    @articles = Article.page(params[:page]).per(3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to @article
    else
      flash[:notice] = 'Article creation failed'
      redirect_to current_user
    end
  end

  def edit; end

  def show; end

  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article #{@article.id} updated successfully"
    else
      flash[:notice] = "Article #{@article.id} update failed"
    end
    redirect_to @article
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article #{@article.id} deleted successfully"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def require_correct_user
    if current_user != @article.user
      flash[:alert] = 'You are not authorized'
      redirect_to current_user
    end
  end
end