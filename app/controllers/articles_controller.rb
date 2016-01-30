class ArticlesController < ApplicationController

  def new
      @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
      
  end

  def edit
      
  end
  
  def show
      
  end
  
  def update
      
  end
  
  def destroy
      
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
