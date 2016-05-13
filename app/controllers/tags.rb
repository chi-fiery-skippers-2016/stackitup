get '/tags' do
  @tags = Tag.all
  if request.xhr?
    erb :'tags/index', locals: {tags: @tags}, layout:false
  else
    erb :'tags/index'
  end
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @tagged_questions = @tag.questions
  erb :'tags/show'
end
