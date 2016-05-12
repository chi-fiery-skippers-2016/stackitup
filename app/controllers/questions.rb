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
  erb :show
end

get '/questions/:id/:sort' do
  @question = Question.find(params[:id])
  @answers = @questions.answers

  case params[:sort]
  when "oldest"
    @answers = @answers.sort{|x,y| x.created_at <=> y.created_at}
  when "active"
    @answers = @answers.sort{|x,y| y.response.last.created_at <=> x.response.last.created_at}
  when "votes"
    @answers = @answers.sort{|x,y| y.votes.count <=> x.votes.count}
  end
  erb :show
  # AJAX THIS SHIT LATER
end
