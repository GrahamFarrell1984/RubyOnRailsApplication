require 'test_helper'

class UserTest < ActiveSupport::TestCase

    test "The password is less than 8 characters long so is not valid" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0") # Creates a new User object with password that is not valid as it is too short and stores it in a variable called user
        assert(!user.valid?, "Password is valid") # Asserts that user object password was not valid, otherwise print "Password is valid" in the terminal
    end

    test "The password is more than 25 characters long so is not valid" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd1sl0ng3rthan25charact3r$") # Creates a new User object with password that is not valid as it is too long and stores it in a variable called user
        assert(!user.valid?, "Password is valid") # Asserts that user object password was not valid, otherwise print "Password is valid" in the terminal
    end

    test "The password does not contain an uppercase letter so is not valid" do
        user = User.new(email: "userOne@testEmail.com", password: "pa$$w0rd") # Creates a new User object with password that is not valid as it is does not contain an uppercase letter and stores it in a variable called user
        assert(!user.valid?, "Password is valid") # Asserts that user object password was not valid, otherwise print "Password is valid" in the terminal
    end

    test "The password does not contain a number so is not valid" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$word") # Creates a new User object with password that is not valid as it is does not contain a number and stores it in a variable called user
        assert(!user.valid?, "Password is valid") # Asserts that user object password was not valid, otherwise print "Password is valid" in the terminal
    end

    test "The password does not contain a special character so is not valid" do
        user = User.new(email: "userOne@testEmail.com", password: "Passw0rd") # Creates a new User object with password that is not valid as it is does not contain a special character and stores it in a variable called user
        assert(!user.valid?, "Password is valid") # Asserts that user object password was not valid, otherwise print "Password is valid" in the terminal
    end

    test "The password is valid" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd") # Creates a new User object with password that is valid as it is does contains an uppercase letter, a lowercase letter, a number, and a special character and stores it in a variable called user
        assert(user.valid?, "Password is not valid") # Asserts that user object password was valid, otherwise print "Password is not valid" in the terminal
    end

    test "A user with no email and no password can not be saved" do
        user = User.new() # Creates a new User object with no email and no password and stores it in a variable called user
        assert_equal("", user.email, "Email is not empty") # Assert that email is empty, otherwise print "Email is not empty" in the terminal
        assert_nil(user.password, "Password is not nil") # Assert that password is nil, otherwise print "Password is not nil" in the terminal
        assert(!user.save, "User was saved") # Asserts that user object was not saved, otherwise print "User was saved" in the terminal
    end

    test "A user with valid email and no password can not be saved" do
        user = User.new(email: "userOne@testEmail.com") # Creates a new User object with valid email and no password and stores it in a variable called user
        assert_equal("userOne@testEmail.com", user.email, "Email does not match") # Assert that email is equal to "userOne@testEmail.com", otherwise print "Email does not match" in the terminal
        assert_nil(user.password, "Password is not nil") # Assert that password is nil, otherwise print "Password is not nil" in the terminal
        assert(!user.save, "User was saved") # Asserts that user object was not saved, otherwise print "User was saved" in the terminal
    end

    test "A user with no email and valid password can not be saved" do
        user = User.new(password: "Pa$$w0rd") # Creates a new User object with no email and valid password and stores it in a variable called user
        assert_equal("", user.email, "Email is not empty") # Assert that email is equal to "", otherwise print "Email is not empty" in the terminal
        assert_equal("Pa$$w0rd", user.password, "Password does not match") # Assert that password is equal to "Pa$$w0rd", otherwise print "Password does not match" in the terminal
        assert(!user.save, "User was saved") # Asserts that user object was not saved, otherwise print "User was saved" in the terminal
    end

    test "A user with valid email and valid password can be saved" do
        user = User.new(email: "userOne@testEmail.com", password: "Pa$$w0rd") # Creates a new User object with valid email and valid password and stores it in a variable called user
        assert_equal("userOne@testEmail.com", user.email, "Email does not match") # Assert that email is equal to "userOne@testEmail.com", otherwise print "Email does not match" in the terminal
        assert_equal("Pa$$w0rd", user.password, "Password does not match") # Assert that password is equal to "Pa$$w0rd", otherwise print "Password does not match" in the terminal
        assert(user.save, "User was not saved") # Asserts that user object was saved, otherwise print "User was not saved" in the terminal
    end

end
