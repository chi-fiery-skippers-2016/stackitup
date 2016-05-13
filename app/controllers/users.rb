
get '/users/new' do
  erb :'sessions/register'
end

post '/users' do
  User.create(params[:user])
  redirect '/login'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
