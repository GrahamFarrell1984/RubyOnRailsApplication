require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

    # The following six tests are for the welcome page of the application
    test "User can navigate to the welcome page" do
        get '/'
        assert_response :success
    end

    test "The title element has the text 'Tascanna' and there is only one title element" do
        get '/'
        assert_select "title", {:count=>1, :text=>"Tascanna"}, "Wrong title or more than one title element"
    end

    test "The welcome page has no forms" do
        get '/'
        assert_select "form", false, "This page must contain no forms"
    end

    test "The h1 element on the welcome page has the text 'Welcome to Tascanna'" do
        get '/'
        assert_select "h1", "Welcome To Tascanna"
    end

    test "The p element on the welcome page has the text 'Helping you increase your productivity!'" do
        get '/'
        assert_select "p", "Helping you increase your productivity!"
    end

    test "The a element on the welcome page has the text 'Sign Up!'" do
        get '/'
        assert_select "a", "Sign Up!"
    end

    # The following three tests are for the about page of the application
    test "User can navigate to the about page" do
        get '/about'
        assert_response :success
    end

    test "The h1 element on the about page has the text 'About Us'" do
        get '/about'
        assert_select "h1", "About Us"
    end

    test "The h3 element on the about page has the text 'Helping you increase your productivity!'" do
        get '/about'
        assert_select "h3", "Helping you increase your productivity!"
    end

    # The following two tests are for the sign up page of the application
    test "User can navigate to the sign up page" do
        get '/users/sign_up'
        assert_response :success
    end

    test "The h2 element on the sign up page has the text 'Sign up'" do
        get '/users/sign_up'
        assert_select "h2", "Sign up"
    end

    # The following two tests are for the sign in page of the application
    test "User can navigate to the sign in page" do
        get '/users/sign_in'
        assert_response :success
    end

    test "The h2 element on the sign in page has the text 'Log in'" do
        get '/users/sign_in'
        assert_select "h2", "Log in"
    end

end
