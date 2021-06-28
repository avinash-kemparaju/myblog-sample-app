class ArticlesController < ApplicationController
  before_filter :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, except: [:show, :index]
  before_filter :require_correct_user, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @article = Article.new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
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
  end
end