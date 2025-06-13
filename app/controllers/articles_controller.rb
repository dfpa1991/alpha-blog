class ArticlesController < ApplicationController
  def show
    # debugger <- call the ruby 3.4 debugger to check on code execution
    # Passes from the url a hash to ruby
    # Instance variable with @ to make it available to the application and also use it in view
    @article = Article.find(params[:id])
  end
end
