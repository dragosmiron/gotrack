require 'spec_helper'
describe "tasks page" do
  it "adds a task to the task list" do
    visit "/"
    fill_in "task_title", :with => "new_task"
    click_button "insert-task"
    expect(page).to have_text("new_task")
  end

  context "navigation" do
    before do
      Task.make!(title: "old_task", date_completed: 1.day.ago.to_date)
      Task.make!(title: "current_task", date_completed: Date.today)
    end
    it "lets me see different tasks for different days" do
      visit "/"
      expect(page).to have_text("current_task")
      click_link "previous-day"
      expect(page).to have_text("old_task")
      click_link "next-day"
      expect(page).to have_text("current_task")
    end
  end
end