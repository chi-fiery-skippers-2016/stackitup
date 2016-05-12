get '/users/:id' do

end

post '/users' do
  User.create(params)
  redirect '/login'
end
