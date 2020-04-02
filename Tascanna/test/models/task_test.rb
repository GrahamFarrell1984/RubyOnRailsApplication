require 'test_helper'

class TaskTest < ActiveSupport::TestCase

    test "The task is invalid - content is less than 4 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "Th.", user_id: user.id) # Creates a new Task object with content that is invalid as it is less than 4 characters long and stores it in a variable called task
        assert(!task.valid?, "Task is valid") # Asserts that task object content was invalid, otherwise print "Task is valid" in the terminal
        assert(task.content.length < 4, "Task content is more than 4 characters")
    end

    test "The task is invalid - content is more than 300 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "This content is going to be over 300 hundred characters long and the user interface should give a warning message to the user because there is validation in place to check the length of content that the user tries to input and save when either creating a new task or editing an existing task when they are logged into their account in this application.", user_id: user.id) # Creates a new Task object with content that is invalid as it is more than 300 characters long and stores it in a variable called task
        assert(!task.valid?, "Task is valid") # Asserts that task object content was invalid, otherwise print "Task is valid" in the terminal
        assert(task.content.length > 300, "Task content is less than 300 characters")
    end

    test "The task is invalid and should not be saved - content is less than 4 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "Th.", user_id: user.id) # Creates a new Task object with content that is invalid as it is less than 4 characters long and stores it in a variable called task
        assert(!task.save, "Task was saved")
        assert(task.content.length < 4, "Task content is more than 4 characters")
    end

    test "The task is invalid and should not be saved - content is more than 300 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "This content is going to be over 300 hundred characters long and the user interface should give a warning message to the user because there is validation in place to check the length of content that the user tries to input and save when either creating a new task or editing an existing task when they are logged into their account in this application.", user_id: user.id) # Creates a new Task object with content that is invalid as it is more than 300 characters long and stores it in a variable called task
        assert(!task.save, "Task was saved")
        assert(task.content.length > 300, "Task content is less than 300 characters")
    end

    test "The task is valid - more than 4 characters and less than 300 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "This content is valid.", user_id: user.id) # Creates a new Task object with content that is valid as it is more than 4 characters and less than 300 characters long and stores it in a variable called task
        assert(task.valid?, "Task is invalid") # Asserts that task object content was valid, otherwise print "Task is invalid" in the terminal
    end

    test "The task is valid and should be saved - more than 4 characters and less than 300 characters" do
        user = User.new(id: 1, email: "userOne@testEmail.com", password: "Pa$$w0rd")
        user.save
        task = Task.new(content: "This content is valid.", user_id: user.id) # Creates a new Task object with content that is valid as it is more than 4 characters and less than 300 characters long and stores it in a variable called task
        assert(task.save, "Task was not saved")
    end

end
