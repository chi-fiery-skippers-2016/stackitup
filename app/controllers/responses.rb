get '/responses/new' do
  if params[:q_id]
    @respondable_id = params[:q_id]
    @respondable_type = 'question'
  else
    @respondable_id = params[:a_id]
    @respondable_type = 'answer'
  end
  erb :'responses/new'
end

post '/responses' do
  authenticate!
  if params[:respondable_type] == 'question'
    respondable = Question.find(params[:respondable_id])
    @question = respondable
  elsif params[:respondable_type] == 'answer'
    respondable = Answer.find(params[:respondable_id])
    @question = respondable.question
  end
  @answers = @question.answers
  Response.create!(body: params[:body], respondable: respondable, user_id: current_user.id)
  erb :'questions/show'
end


# post '/answers' do
#   authenticate!
#   Answer.create!(body: params[:body], question_id: params[:question_id], theOneWhoAnswers_id: current_user.id)
#   @question = Question.find(params[:question_id])
#   @answers = @question.answers
#   erb :'questions/show'
# end


#   @question = Question.find(params[:id])
#   @answers = @question.answers
#   answer = Answer.find(params[:answer_id]) if params[:answer_id]
#   voteable = params[:voteable] == 'question' ? @question : answer
#   direction = params[:direction] == 'up' ? true : false

#   Vote.create!(voteable: voteable, voter_id: current_user.id, up?: direction)
#   erb :'questions/show'
