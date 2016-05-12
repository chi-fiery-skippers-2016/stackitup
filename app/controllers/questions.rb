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
  p params
  tag_string = params.delete('tag_names')
  new_question = Question.new(params[:question])
  new_question.save
  tag_names=tag_string

  ## ADD USER ERRORS

  redirect '/questions'
end

post '/questions/:id/votes' do
  authenticate! # THIS SHOULD REALLY GIVE ERROR MESSAGE INSTEAD
  @question = Question.find(params[:id])
  @answers = @question.answers
  answer = Answer.find(params[:answer_id]) if params[:answer_id]
  voteable = params[:voteable] == 'question' ? @question : answer
  direction = params[:direction] == 'up' ? true : false

  Vote.create!(voteable: voteable, voter_id: current_user.id, up?: direction)
  erb :'questions/show'
end
