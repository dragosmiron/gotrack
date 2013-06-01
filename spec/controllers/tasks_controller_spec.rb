require 'spec_helper'

describe TasksController do

  let!(:task) { Task.create(description: 'Delete me') }

  it 'delets task' do
    expect{
      delete :destroy, id: task
    }.to change(Task, :count).by(-1)
  end
end
