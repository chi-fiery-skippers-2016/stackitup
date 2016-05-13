post '/answers' do
  authenticate!
  Answer.create!(body: params[:body], question_id: params[:question_id], theOneWhoAnswers_id: current_user.id)
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :'questions/show'
end


