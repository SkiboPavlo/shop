class ArticlesController < ApplicationController

  before_action :load_article, only: [:edit, :update, :destroy, :buy, :redo]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def compare
  end

  def edit
  end

  def redo
    @article.status = 1
    @article.save
    redirect_to :back
  end

  def buy
    @article.status = 0
    @article.save
    redirect_to :back
  end

  def create
    @article = Article.new(article_params.merge({status: 1}))
    if @article.save
      redirect_to articles_path
    else
      flash[:errors] = @article.errors.messages
      redirect_to :back
    end
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to articles_path
    else
      flash[:errors] = @article.errors.messages
      redirect_to :back
    end
  end

   def destroy
    @article.destroy
    redirect_to :back
  end

   private

  def load_article
    @article = Article.find params[:id]
  end

  def article_params
    params.require(:article).permit(:text, :price, :status)
  end
end
