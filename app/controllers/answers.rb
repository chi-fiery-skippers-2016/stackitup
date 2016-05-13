post '/answers' do
  authenticate!
  @answer = Answer.create!(body: params[:body], question_id: params[:question_id], theOneWhoAnswers_id: current_user.id)
  @question = Question.find(params[:question_id])
  if request.xhr?
    erb :'questions/_answer', locals: { question: @question, answer: @answer }, layout:false
  else
    erb :'questions/show'
  end
end


