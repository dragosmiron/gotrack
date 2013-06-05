require 'machinist/active_record'

Task.blueprint do
  title  { "new_task" }
  date_completed { Date.today }
end