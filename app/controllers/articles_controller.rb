class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

# ********************************************
  def show
    # moved to set article def
    # @article = Article.find(params[:id])
  end
# ********************************************


# *******************************************
  def index
    @articles = Article .all
  end
# *******************************************


# *******************************************
  def new
    @article =   Article.new
  end
# *******************************************


# *******************************************
  def create
   @article = Article.new(articles_params)
    if  @article.save
      flash[:notice] = "Article created Successfully"
       redirect_to @article
    else
       render 'new'
     end
  end
# *******************************************


# *******************************************
  def edit
    # moved to set article def
    # @article = Article.find(params[:id])
  end
# *******************************************


# *******************************************
  def update
    # moved to set article def
    # @article = Article.find(params[:id])
    if @article.update(articles_params)
      flash[:notice] = "Article updated Successfully"
      redirect_to @article
    else
      render 'edit'
  end
end
# *******************************************


# *******************************************
def destroy
  # moved to set article def
  # @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Articles deleted Successfully"
  redirect_to articles_path
end
# *******************************************


  private

# *******************************************
  def articles_params
     params.require(:article).permit(:title, :description)
  end
# *******************************************


# *******************************************
  def set_article
    @article = Article.find(params[:id])
  end
# *******************************************

end
