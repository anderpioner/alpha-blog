class ArticlesController < ApplicationController

  def new
      @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was succesfuly created" #it only works if you add a code on the view page, in this case aplication view, which is a file that is shown on all the app pages
      redirect_to article_path(@article) #article_path depends on the path on the rake routes command
    else
      render 'new'
    end
    
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])  
    if @article.update(article_params)
      flash[:notice] = "Article was succesfuly updated" #it only works if you add a code on the view page, in this case aplication view, which is a file that is shown on all the app pages
      redirect_to article_path(@article) #article_path depends on the path on the rake routes command
    else
      render 'edit'
    end      
  end
  
  def destroy
    @article = Article.find(params[:id]) 
    @article.destroy
    flash[:notice] = "Article was succesfuly deleted"
    redirect_to articles_path
  end
  
  def index
      @articles=Article.all
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
