class ArticleController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user, except: [:index, :show]
	
	def index
		@articles = Article.paginate(page: params[:page])
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:success] = "Article Posted"
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:success] = "Article Updated"
			redirect_to @article
		else 
			render 'edit'
		end
	end

	def destroy
        Article.find(params[:id]).destroy
        flash[:success] = "Article deleted"
        redirect_to articles_url
	end

	private
		def article_params
			params.require(:article).permit(:title, :content)
		end

end
