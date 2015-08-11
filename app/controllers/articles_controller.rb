class ArticlesController < ApplicationController
	before_action :logged_in_user
	before_action :admin_user, except: [:index, :show]
	
	def index
		@articles = Article.paginate(page: params[:page])
	end

	def show
		@article = Article.find(params[:id])
		@tags = @article.has_tags
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			params[:relevant_tags].each do |key, value|
				if value == "1" 
					taglib = TagLib.find_by(tag: key)
					@article.mark(taglib)
				end
			end
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
			params[:relevant_tags].each do |key, value|
				taglib = TagLib.find_by(tag: key)
				if value == "1" && !@article.has_tags.include?(taglib)
					@article.mark(taglib)
				elsif value == "0" && @article.has_tags.include?(taglib)
					@article.unmark(taglib)
				end
			end
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
			params.require(:article).permit(:title, :content, :description)

		end

end
