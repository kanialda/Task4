class ArticlesController < ApplicationController
   before_action :set_article, only: [:show, :edit, :update, :destroy]
   
  def new 
    @article = Article.new
  end

  def create
    # binding.pry
    @article = Article.new(params_article)
    if @article.save
        flash[:notice] = "Success Add Records"
        redirect_to action: 'index'
    else
        flash[:error] = "data not valid"
        render 'new'
    end
  end

  def index
    # @articles = Article.all
    @articles = Article.page(params[:page]).per(15)
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @article.update(params_article)
      flash[:notice] = "Success Update Records"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Success Delete a Records"
      redirect_to action: 'index'
    else
      flash[:error] = "fails delete a records"
      redirect_to action: 'index'
    end
  end


  private
    def set_article
      @article = Article.find(params[:id])
    end

  def params_article
    params.require(:article).permit(:title, :content, :image)
  end

end
