get '/questions' do
  sort_by = params[:sort] || 'recent'
  @questions = Question.sort_questions(sort_by)
  erb :'questions/index'
end

get '/questions/new' do
  authenticate!
  erb :'questions/new'
end

  # AJAX THIS SHIT LATER
get '/questions/:id' do
  @question = Question.find(params[:id])
  sort_by = params[:sort] || 'votes'
  @answers = @question.sort_answers(sort_by)
  erb :'questions/show'
end

post '/questions' do
  #create new question with params
  erb :'questions/index'
end

post '/questions/:id/votes' do
  authenticate!
  @question = Question.find(params[:id])
  direction = params[:direction] == 'up' ? true : false
  Vote.create!(voteable: @question, voter_id: current_user.id, up?: direction)
  @answers = @question.answers
  erb :'questions/show'
end
