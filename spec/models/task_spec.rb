require 'spec_helper'

describe Task do
  it 'deletes' do
    task = Task.new(description: 'new')
    task.save
    task.delete
    expect(Task.all.count).to eq 0
  end
end
