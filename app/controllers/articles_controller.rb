class ArticlesController < ApplicationController

  before_action :get_article, only: [:show, :edit, :update]

  def index
    #dung de phan trang
    @articles = Article.paginate(page: params[:page], per_page: 3)
    # @articles = Article.all
  end

  def show
    # use before action.
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      redirect_to article_path(@article)
      flash[:notice] = 'Successfully Saved Article'
    else
      render 'new'
    end
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Successfully Updated Article'
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def destroy
    Article.find(params[:id]).destroy
    # redirect_to :action => 'index'
    flash[:notice] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
