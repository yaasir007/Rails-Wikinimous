class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @articles = Article.new(params_articles)
        @articles.save
        redirect_to articles_path
    end

    def show
    end

    def edit
    end

    def update
        @article.update(params_articles)
        redirect_to article_path(@article)
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def find_article
        @article = Article.find(params[:id])
    end

    def params_articles
        params.require(:article).permit(:title, :content)
    end 
end
