class ArticlesController < ApplicationController
  def show
    # debugger <- call the ruby 3.4 debugger to check on code execution
    # Passes from the url a hash to ruby
    # Instance variable with @ to make it available to the application and also use it in view
    @article = Article.find(params[:id])
  end
  def index
    # Follow the convection. The appropriate variable name
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article created successfully."
      # article_path
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
end
