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

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  #create new question with params
  erb :'questions/index'
end
