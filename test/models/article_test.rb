require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	
	test "should mark or unmark a tag" do
		article = articles(:sample_article1)
		tag = tag_libs(:tag3)
		assert_not article.has_tag?(tag)
		article.mark(tag)
		assert article.has_tag?(tag)
		assert tag.has_articles.include?(article)
		article.unmark(tag)
		assert_not article.has_tag?(tag)
	end

end
