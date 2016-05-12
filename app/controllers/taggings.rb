get '/taggings' do
  erb :'tags/index'
end

get '/taggings/:id' do
  @tag = Tag.find(params[:id])
  erb :'tags/show'
end
