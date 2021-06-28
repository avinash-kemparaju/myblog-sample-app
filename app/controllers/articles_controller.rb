class ArticlesController < ApplicationController
  before_filter :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, except: [:new, :show, :index]
  before_filter :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      redirect_to current_user
    end
  end

  def edit
  end

  def show
  end

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
      flash[:alert] = "You are not authorized"
      redirect_to @user
    end
  end
end