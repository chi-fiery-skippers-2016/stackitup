get '/questions' do
  puts params
  puts params[:sort]
  sort_by = params[:sort] || 'recent'
  @questions = Question.sort_questions(sort_by)

  if request.xhr?
    erb :"questions/_tab_content", locals: { questions: @questions }, layout:false
  else
    erb :'questions/index'
  end
end

get '/questions/new' do
  authenticate!
  erb :'questions/new'
end

  # AJAX THIS SHIT LATER
get '/questions/:id' do
  puts params
  @question = Question.find(params[:id])
  sort_by = params[:sort] || 'votes'
  @answers = @question.sort_answers(sort_by)
  puts @question
  puts @answers

  if request.xhr?
    erb :"questions/_answer_content", locals: { question: @question, answers: @answers }, layout:false
  else
    erb :'questions/show'
  end
end

post '/questions' do
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

  vote = Vote.new(voteable: voteable, voter_id: current_user.id, up?: direction)
  if vote.double_voting?(session[:user_id]) # returning? true/false
    # THROW ERROR MESSAGE
  else
    vote.save
  end
  erb :'questions/show'
end
