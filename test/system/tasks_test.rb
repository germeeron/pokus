require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:germee)
    login_as(@user, '123456')
    @category = categories(:first_category)
    @task = @category.tasks(:first_task)
  end

  test "creating a Task" do
    visit categories_url
    click_on @category.title

    fill_in "Name", with: "new task name"
    fill_in "Notes", with: "new task notes"
    fill_in "Due date", with: "new task due date"
    fill_in "Complete", with: "false"
    click_on "Create Task"

    assert_text @task.name
  end

  test "updating a Task" do
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: "updated name"
    fill_in "Notes", with: @task.notes
    fill_in "Due date", with: @task.due_date
    fill_in "Complete", with: @task.complete
    click_on "Update Task"

    assert_text "updated name"
  end

  test "showing a Task" do
    visit categories_url
    click_on "Show", match: :first

    assert_text @task.name
    assert_text @task.notes
    assert_text @task.due_date
    assert_text @task.complete
  end

  test "destroying a Task" do
    visit categories_url
    click_on @category.title

    page.accept_confirm do
        click_on "Delete", match: :first
    end

    assert(@task.name == nil)
    assert(@task.notes == nil)
    assert(@task.due_date == nil)
    assert(@task.complete == nil)
  end

  test "marking a Task complete" do
    visit category_tasks_url
    page.check ""
    assert(@task.complete == true)
  end
end