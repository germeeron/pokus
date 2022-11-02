require "application_system_test_case"

class DueTasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:germee)
    login_as(@user, '123456')
    @task = tasks(:first_task)
  end
  
  test "showing tasks due today" do
    visit categories_url
    click_on "today"
        
    assert_text "tasks due today"
  end

  test "showing overdue tasks" do
    visit categories_url
    click_on "overdue"
        
    assert_text "overdue tasks"
  end

  test "tasks due soon" do
    visit categories_url
    click_on "soon"
        
    assert_text "tasks due soon"
  end
end