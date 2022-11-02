require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
    setup do
        @user = users(:germee)
        login_as(@user, '123456')
        @category = categories(:first_category)
    end

    test "visiting the index" do       
        visit categories_url
        assert_text "categories"
    end

    test "creating a Category" do
        visit categories_url
        click_on "+"

        fill_in "Title", with: "new title"
        click_on "Create Category"

        assert_text @category.title
    end

    test "updating a Category" do
        visit categories_url
        click_on "Edit", match: :first

        fill_in "Title", with: "new title"
        click_on "Update Category"

        assert_text "new title"
    end

    test "showing a Category" do
        visit categories_url
        click_on @category.title

        assert_text @category.title + " tasks"
    end

    test "destroying a Category" do
        visit categories_url
        page.accept_confirm do
            click_on "Delete", match: :first
        end

        assert_not(@category.title == nil)
    end
end