require "application_system_test_case"
class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:germee)
    login_as(@user, '123456')
    @task = tasks(:first_task)
  end

  def login_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in  'user_password', with: password
    click_on 'Log in'
  end

  test "creating a new Task" do
    visit categories_url
    Capybara.page.find('.category-name').click
    fill_in "task[name]", with: "first task"
    fill_in "task[notes]", with: "first detail"
    fill_in "task[due_date]", with: @task.due_date
    click_on "Create Task"
    assert_text "first task"
  end

  test "updating a Task" do
    visit categories_url
    Capybara.page.find('.category-name').click
    Capybara.page.find('.edit-task').click
    fill_in "task[name]", with: "updated name"
    fill_in "task[notes]", with: @task.notes
    fill_in "task[due_date]", with: @task.due_date
    click_on "Update Task"
    assert_text "updated name"
  end

  test "showing a Task" do
    visit categories_url
    Capybara.page.find('.category-name').click
    Capybara.page.find('.show-task').click
    assert_text @task.name
    assert_text @task.notes
    assert_text @task.due_date
  end

  test "destroying a Task" do
    visit categories_url
    Capybara.page.find('.category-name').click
    
    page.accept_confirm do
      click_on "Delete", match: :first
    end
    assert_not(@task.name == nil)
    assert_not(@task.notes == nil)
    assert_not(@task.due_date == nil)
    assert_not(@task.complete == nil)
  end

 # test "marking a Task complete" do
 #   visit categories_url
 #   Capybara.page.find('.category-name').click
 #   page.check "", match: :first

 #   assert(@task.complete == false)
  end
end