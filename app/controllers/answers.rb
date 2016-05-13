post '/answers' do
  authenticate!
  @answer = Answer.create!(body: params[:body], question_id: params[:question_id], theOneWhoAnswers_id: current_user.id)
  @question = Question.find(params[:question_id])
  puts "made the answer"
  if request.xhr?
    puts "ajax"
    erb :'questions/_answer', locals: { question: @question, answer: @answer }, layout:false
  else
    puts "not ajax"
    erb :'questions/show'
  end
end


