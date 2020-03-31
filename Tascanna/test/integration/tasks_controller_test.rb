require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

    # The following tests are for the tasks page of the application
    test "Redirect user to sign in page if they try to navigate to tasks page when they aren't logged in" do
        get '/tasks'
        assert_response :redirect
    end

    test "The user can navigate to tasks page when they are logged in" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks'
        assert_response :success
    end

    test "First h1 element on the tasks page has the text 'To Do'" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks'
        assert_select "h1", "To Do"
    end

    test "Second h1 element on the tasks page has the text 'Doing'" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks'
        assert_select "h1", "Doing"
    end

    test "Third h1 element on the tasks page has the text 'Done'" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks'
        assert_select "h1", "Done"
    end

    # The following tests are for the new tasks page of the application
    test "The user can navigate to the new task page" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks/new'
        assert_response :success
    end

    test "The h2 element on the tasks page has the text 'New Task'" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks/new'
        assert_select "h2", "New Task"
    end

    test "The a element on the tasks page has the text 'Go back to all tasks'" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_in user
        get '/tasks/new'
        assert_select "a", "Go back to all tasks"
    end

    test "The user can sign out" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd")
        sign_out user
        get '/'
        assert_response :success
    end

end
