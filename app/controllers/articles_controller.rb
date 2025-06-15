class ArticlesController < ApplicationController
  # Call the variable before the methods perform an action. Add the methods that are going to call the private method
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  def show
    # debugger <- call the ruby 3.4 debugger to check on code execution
    # Passes from the url a hash to ruby
    # Instance variable with @ to make it available to the application and also use it in view
    # Calls the
  end
  def index
    # Follow the convection. The appropriate variable name
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def edit
    # debugger
  end
  def create
    # Whitelist
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created successfully."
      # article_path
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  def update
    # debugger
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully."
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article.destroy
    flash[:notice] = "Article deleted successfully."
    redirect_to articles_path
  end
  # Any methods are only available to the class
  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
