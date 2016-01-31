class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  

  def new
      @article = Article.new
  end
  
  def create
    
    @article = Article.new(article_params)
    #debugger
    @article.user = User.first
    if @article.save
       flash[:success] = "Article was succesfuly created" #it only works if you add a code on the view page, in this case aplication view, which is a file that is shown on all the app pages
      redirect_to article_path(@article) #article_path depends on the path on the rake routes command
    else
      render 'new'
    end
    
  end

  def edit

  end
  
  def show

  end
  
  def update

    if @article.update(article_params)
       flash[:success] = "Article was succesfuly updated" #it only works if you add a code on the view page, in this case aplication view, which is a file that is shown on all the app pages
      redirect_to article_path(@article) #article_path depends on the path on the rake routes command
    else
      render 'edit'
    end      
  end
  
  def destroy
    
    @article.destroy
     flash[:danger] = "Article was succesfuly deleted"
    redirect_to articles_path
  end
  
  def index
      @articles=Article.all
  end
  
  private
    def set_article
      @article = Article.find(params[:id]) 
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
