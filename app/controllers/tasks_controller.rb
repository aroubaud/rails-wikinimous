class TasksController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # GET /articles/:id
  end

  def new
    # GET /articles/new
    # Render a form

    @article = Article.new
  end

  def create
    # POST /articles
    # Create a article in the DB

    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def edit
    # GET /articles/:id/edit
    # Render a form for editing
  end

  def update
    # PATCH /articles/:id

    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    # DELETE /articles/:id

    @article.destroy!

    redirect_to articles_all_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
