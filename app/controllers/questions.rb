get '/questions' do
  @questions = Question.all
  erb :index

=begin
Can sort questions by
recent - created_at
highest votes
trending -

=end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.sort('votes')
  erb :show
end

get '/questions/:id/:sort' do
  @question = Question.find(params[:id])
  @answers = @question.sort(params[:sort])

  erb :show
  # AJAX THIS SHIT LATER
end
