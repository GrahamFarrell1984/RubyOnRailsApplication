require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

    test "A new user should be able to create a new account with a valid email and password" do

        visit "/"

        click_on "Sign Up!"

        fill_in "user_email", with: "userOne@testEmail.com"

        fill_in "user_password", with: "Pa$$w0rd"

        fill_in "user_password_confirmation", with: "Pa$$w0rd"

        click_on "Sign up"

        assert_text "Welcome! You have signed up successfully."

    end

    test "A new user should not be able to create a new account with an invalid email or password" do

        visit "/"

        click_on "Sign Up!"

        fill_in "user_email", with: "test@example.com"

        fill_in "user_password", with: "f4k3p455w0rd"
        
        fill_in "user_password_confirmation", with: "f4k3p455w0rd"

        click_on "Sign up"

        assert_text "Password Complexity requirement not met. Length should be 8-25 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character"

    end

    test "An existing user should be able to log in with a valid email and password" do

        user = User.create(:email => 'userOne@testEmail.com', :password => 'Pa$$w0rd')

        visit "/"

        click_on "Log In"

        fill_in "user_email", with: user.email

        fill_in "user_password", with: user.password

        click_on "Log in"

        login_as(user, :scope => :user)

        assert_text "Signed in successfully."

    end

    test "An existing user should not be able to log in with an invalid email or password" do

        user = User.create(:email => 'test@example.com', :password => 'f4k3p455w0rd')

        visit "/"

        click_on "Log In"

        fill_in "user_email", with: user.email

        fill_in "user_password", with: user.password

        click_on "Log in"

        login_as(user, :scope => :user)

        assert_text "Invalid Email or password."

    end

end
