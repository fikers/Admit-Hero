class ArticleController < ApplicationController
	
	def index
	end

	def show
		@article = Article.find(param[:id])
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

end
