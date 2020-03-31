require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase

    test "A user should be able to create a new task if the content is valid - more than 4 characters and less than 300 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my first task."

        click_on "Create Task"

        assert_text "Task was successfully created"

    end

    test "A user should not be able to create a new task if the content is invalid - content is less than 4 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "Th."

        click_on "Create Task"

        assert_text "Content is too short (minimum is 4 characters)"

    end

    test "A user should not be able to create a new task if the content is invalid - content is more than 300 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This content is going to be over 300 hundred characters long and the user interface should give a warning message to the user because there is validation in place to check the length of content that the user tries to input and save when either creating a new task or editing an existing task when they are logged into their account in this application."

        click_on "Create Task"

        assert_text "Content is too long (maximum is 300 characters)"

    end

    test "A user should be able to edit an existing task if the content is valid - content is more than 4 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my second task."

        click_on "Create Task"

        assert_text "Task was successfully created"

        click_on "Edit Tasks"

        fill_in "task_content", with: "This is my second task edited."

        click_on "Update Task"

        assert_text "Task was successfully updated"

    end

    test "A user should be able to edit an existing task if the content is valid - content is less than 300 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my third task."

        click_on "Create Task"

        assert_text "Task was successfully created"

        click_on "Edit Tasks"

        fill_in "task_content", with: "This content is going to be less than 300 hundred characters long and the user should be able to update the existing task as the content that they have entered is valid."

        click_on "Update Task"

        assert_text "Task was successfully updated"

    end

    test "A user should not be able to edit an existing task if the content is invalid - content is less than 4 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my fourth task."

        click_on "Create Task"

        assert_text "Task was successfully created"

        click_on "Edit Tasks"

        fill_in "task_content", with: "Th."

        click_on "Update Task"

        assert_text "Content is too short (minimum is 4 characters)"

    end

    test "A user should not be able to edit an existing task if the content is invalid - content is more than 300 characters" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my fifth task."

        click_on "Create Task"

        assert_text "Task was successfully created"

        click_on "Edit Tasks"

        fill_in "task_content", with: "This content is going to be over 300 hundred characters long and the user interface should give a warning message to the user because there is validation in place to check the length of content that the user tries to input and save when either creating a new task or editing an existing task when they are logged into their account in this application."

        click_on "Update Task"

        assert_text "Content is too long (maximum is 300 characters)"

    end

    test "A user should be able to delete an existing task" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        login_as(user, :scope => :user)

        visit "/tasks"

        click_on "New Task"

        fill_in "task_content", with: "This is my third task."

        click_on "Create Task"

        assert_text "Task was successfully created"

        click_on "All Tasks"

        click_on "Delete Task"

        assert_text "Task was successfully deleted"

    end

end
