get '/questions' do
  sort_by = params[:sort] || 'recent'
  @questions = Question.sort_questions(sort_by)
  erb :index
end

get '/questions/new' do
  erb :'questions/new'
end

  # AJAX THIS SHIT LATER
get '/questions/:id' do
  @question = Question.find(params[:id])
  sort_by = params[:sort] || 'votes'
  @answers = @question.sort_answers(sort_by)
  erb :show
end
