get '/questions/new' do
  erb :'questions/new'
end


get '/questions' do
  sort_by = params[:sort] || 'recent'
  @questions = Question.sort_questions(sort_by)
  erb :'questions/index'
end


  # AJAX THIS SHIT LATER
get '/questions/:id' do
  @question = Question.find(params[:id])
  sort_by = params[:sort] || 'votes'
  @answers = @question.sort_answers(sort_by)
  erb :'questions/show'
end

post '/questions' do
  puts params
  tag_string = params.delete('tag_names')
  new_question = Question.new(params[:question])
  new_question.save
  tag_names=tag_string

  ## ADD USER ERRORS

  redirect '/questions'
end
