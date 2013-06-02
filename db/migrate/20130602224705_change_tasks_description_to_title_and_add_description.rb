class ChangeTasksDescriptionToTitleAndAddDescription < ActiveRecord::Migration
  def change
    rename_column :tasks, :description, :title
    add_column :tasks, :description, :text
  end
end
