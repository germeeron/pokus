require "application_system_test_case"
class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:germee)
    login_as(@user, '123456')
    @category = categories(:first_category)
    @task = tasks(:first_task)
  end

  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in  'user_password', with: password
    click_on 'Log in'
  end

  test "creating a Category" do
    visit categories_url
    click_on @category.title

    fill_in "Name", with: "new title"
    fill_in "Notes", with: "new notes"
    fill_in "Due date", with: "new due date"
    click_on "Create Task"

    assert_text @task.name
end

  test "updating a Task" do
    visit categories_url
    click_on @category.title
    click_on "Edit", match: :first

    fill_in "Name", with: "updated task name"
    fill_in "Notes", with: @task.notes
    fill_in "Due date", with: @task.due_date
    click_on "Update Task"

    assert_text "updated task name"
  end

  test "showing a Task" do
    visit categories_url
    click_on @category.title
    click_on "Show", match: :first
    
    assert_text @task.name
    assert_text @task.notes
    assert_text @task.due_date
  end

  test "destroying a Task" do
    visit categories_url
    click_on @category.title
    
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_no_text @task.name
  end

  test "marking a Task complete" do
    visit categories_url
    click_on @category.title
    page.check "", match: :first

    assert_no_text "false"
  end
end