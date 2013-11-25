desc "delegate todos to user"
task :user_todos => :environment do
  user = User.first
  Todo.all.each do |todo|
    todo.user = user
    todo.save
  end
end