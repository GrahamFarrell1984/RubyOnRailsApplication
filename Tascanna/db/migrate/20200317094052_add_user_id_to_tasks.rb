class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :user_id, :integer # Add a column called user_id with a type of integer to the tasks table
  end
end
