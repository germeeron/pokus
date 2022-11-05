require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without title" do
    # category = Category.new(title: nil)
    # assert_not category.save, "Saved the category without a title"
    # not sure, if it's not saving because there's no user or because there's no title

    @germee = users(:germee)
    category = @germee.categories.build(title: nil)

    assert_not category.save
  end
end