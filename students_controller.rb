require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do
  @students = Student.all()
  erb(:index)
end

# new
get '/students/new' do
  @houses = House.all()
  erb(:new)
end

# create
post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# show
get '/students/:id' do
  @student = Student.find(params[:id].to_i)
  erb(:show)
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id].to_i)
  @houses = House.all()
  erb(:edit)
end

# update
post '/students/:id' do
  Student.new(params).update
  redirect to '/students'
end

# destroy
post '/students/:id/death' do
  student = Student.find(params[:id].to_i)
  student.delete()
  redirect to '/students'
end
