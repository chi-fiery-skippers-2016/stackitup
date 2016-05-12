
get "/users/new" do
  erb :register
end

post '/users' do
  User.create(params)
  redirect '/login'
end

get '/users/:id' do

end
