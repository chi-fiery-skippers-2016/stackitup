
get "/users/new" do
  erb :register
end

post '/users' do
  User.create(params[:user])
  redirect '/login'
end

get '/users/:id' do

end
