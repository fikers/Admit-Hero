require 'test_helper'

class ArticleTagRelationshipTest < ActiveSupport::TestCase
	  def setup
	    @relationship = ArticleTagRelationship.new(article_id: 1, tag_id: 2)
	  end

	  test "should be valid" do
	    assert @relationship.valid?
	  end

	  test "should require a article_id" do
	    @relationship.article_id = nil
	    assert_not @relationship.valid?
	  end

	  test "should require a tag_id" do
	    @relationship.tag_id = nil
	    assert_not @relationship.valid?
	  end
end
