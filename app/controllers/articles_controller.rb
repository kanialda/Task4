class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    flash[:notice] = "Success Add Records"
    redirect_to action: 'index'
  end

  def edit
  end
  
  private
    def params_article
        params.require(:article).permit(:title, :content, :status)
    end
end
