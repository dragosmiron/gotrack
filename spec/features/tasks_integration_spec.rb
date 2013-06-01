require 'spec_helper'
describe "tasks page" do
  it "adds a task to the task list" do
    visit "/"
    fill_in "Task", :with => "new_task"
    click_button "Add"
    expect(page).to have_text("new_task")
  end
end